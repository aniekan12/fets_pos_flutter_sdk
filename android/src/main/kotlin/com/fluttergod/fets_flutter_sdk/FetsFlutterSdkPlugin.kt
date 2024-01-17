package com.fluttergod.fets_flutter_sdk

import android.content.BroadcastReceiver
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import androidx.activity.result.ActivityResultLauncher
import androidx.activity.result.contract.ActivityResultContracts
import androidx.annotation.Keep
import androidx.annotation.NonNull
import androidx.core.app.ActivityCompat.startActivityForResult
import com.google.gson.JsonObject
import io.flutter.embedding.android.FlutterFragmentActivity

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** FetsFlutterSdkPlugin */
class FetsFlutterSdkPlugin : FlutterPlugin, FlutterFragmentActivity(), MethodCallHandler, IFetsCallBack {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private lateinit var resultLauncher: ActivityResultLauncher<Intent>
    private lateinit var result: Result

    init {
        iFetsCallback = this
    }


    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        try {
            channel = MethodChannel(flutterPluginBinding.binaryMessenger, FETS_CHANNEL)
            channel.setMethodCallHandler(this)
        } catch (e: Exception) {
            // Handle exception
            e.printStackTrace()
        }
    }


    override fun onMethodCall(call: MethodCall, result: Result) {

        this.result = result

        when (call.method) {
            "getPlatformVersion" -> {
                result.success("Android ${android.os.Build.VERSION.RELEASE}")
            }

            "cardPayment" -> {
                if (call.argument<String>("amount") != null) {
                    makePayment(
                        FetsTransactionModel(
                            amount = call.argument<Double>("amount")!!,
                            reference = call.argument<String?>("reference") ?: ""
                        ),
                        result
                    )
                } else {
                    result.error("MISSING_AMOUNT", "Amount is required", null)
                }
            }

            else -> {
                result.notImplemented()
            }
        }
    }

    private fun makePayment(paymentModel: FetsTransactionModel, result: Result) {
        try {
            if (::resultLauncher.isInitialized) {
                val jsonObject = JsonObject()
                jsonObject.addProperty("amount", paymentModel.amount)
                jsonObject.addProperty("reference", paymentModel.reference ?: "")

                val intent = Intent(FETS_INTENT)
                    .putExtra("data", jsonObject.toString())
                    .setAction(FETS_INTENT)
                    .setPackage(IRECHARGE_PACKAGE_NAME)
                    .addFlags(Intent.FLAG_INCLUDE_STOPPED_PACKAGES)
                    .setComponent(ComponentName(IRECHARGE_PACKAGE_NAME, FETS_PACKAGE_NAME))

                startActivityForResult(intent, FETS_REQUEST_CODE)
            } else {
                result.error("LAUNCH_ERROR", "Result launcher not initialized", null)
            }
        } catch (e: Exception) {
            result.error("LAUNCH_ERROR", "Failed to launch activity", null)
        }
    }


    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    companion object {
        private const val FETS_CHANNEL = "com.fets.flutter"
        private const val FETS_INTENT = "fets.pos.checkout"
        private const val IRECHARGE_PACKAGE_NAME = "com.fets.posmini"
        private const val FETS_PACKAGE_NAME = "com.fets.posmini.Purchase"
        const val FETS_REQUEST_CODE = 1000
    }

    override fun callBack(result: Any?) {
        this.result.success(result)
    }
}

interface IFetsCallBack {
    fun callBack(result: Any?)
}

@Keep
data class FetsTransactionModel(
    val amount: Double,
    val reference: String?
)

var iFetsCallback: IFetsCallBack? = null


class FetsCheckoutBroadcastReceiver : BroadcastReceiver() {
    override fun onReceive(ctx: Context?, intent: Intent) {
        if (iFetsCallback != null) {
            iFetsCallback?.callBack(intent.extras?.get("data"))
        }
    }
}