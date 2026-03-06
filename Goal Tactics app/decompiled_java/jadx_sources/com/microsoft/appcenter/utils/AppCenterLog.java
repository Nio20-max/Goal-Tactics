package com.microsoft.appcenter.utils;

import android.util.Log;
import java.util.logging.Level;
import java.util.logging.Logger;

/* JADX INFO: loaded from: classes2.dex */
public class AppCenterLog {
    public static final String LOG_TAG = "AppCenter";
    public static final int NONE = 8;
    private static Logger mCustomLogger = null;
    private static int sLogLevel = 7;

    public static void setLogger(Logger logger) {
        mCustomLogger = logger;
    }

    public static int getLogLevel() {
        return sLogLevel;
    }

    public static void setLogLevel(int logLevel) {
        sLogLevel = logLevel;
    }

    public static void verbose(String tag, String message) {
        if (sLogLevel <= 2) {
            Logger logger = mCustomLogger;
            if (logger != null) {
                logger.log(Level.ALL, getMessageWithTag(tag, message));
            } else {
                Log.v(tag, message);
            }
        }
    }

    public static void verbose(String tag, String message, Throwable throwable) {
        if (sLogLevel <= 2) {
            Logger logger = mCustomLogger;
            if (logger != null) {
                logger.log(Level.ALL, getMessageWithTag(tag, message), throwable);
            } else {
                Log.v(tag, message, throwable);
            }
        }
    }

    public static void debug(String tag, String message) {
        if (sLogLevel <= 3) {
            Logger logger = mCustomLogger;
            if (logger != null) {
                logger.log(Level.FINE, getMessageWithTag(tag, message));
            } else {
                Log.d(tag, message);
            }
        }
    }

    public static void debug(String tag, String message, Throwable throwable) {
        if (sLogLevel <= 3) {
            Logger logger = mCustomLogger;
            if (logger != null) {
                logger.log(Level.FINE, getMessageWithTag(tag, message), throwable);
            } else {
                Log.d(tag, message, throwable);
            }
        }
    }

    public static void info(String tag, String message) {
        if (sLogLevel <= 4) {
            Logger logger = mCustomLogger;
            if (logger != null) {
                logger.log(Level.INFO, getMessageWithTag(tag, message));
            } else {
                Log.i(tag, message);
            }
        }
    }

    public static void info(String tag, String message, Throwable throwable) {
        if (sLogLevel <= 4) {
            Logger logger = mCustomLogger;
            if (logger != null) {
                logger.log(Level.INFO, getMessageWithTag(tag, message), throwable);
            } else {
                Log.i(tag, message, throwable);
            }
        }
    }

    public static void warn(String tag, String message) {
        if (sLogLevel <= 5) {
            Logger logger = mCustomLogger;
            if (logger != null) {
                logger.log(Level.WARNING, getMessageWithTag(tag, message));
            } else {
                Log.w(tag, message);
            }
        }
    }

    public static void warn(String tag, String message, Throwable throwable) {
        if (sLogLevel <= 5) {
            Logger logger = mCustomLogger;
            if (logger != null) {
                logger.log(Level.WARNING, getMessageWithTag(tag, message), throwable);
            } else {
                Log.w(tag, message, throwable);
            }
        }
    }

    public static void error(String tag, String message) {
        if (sLogLevel <= 6) {
            Logger logger = mCustomLogger;
            if (logger != null) {
                logger.log(Level.SEVERE, getMessageWithTag(tag, message));
            } else {
                Log.e(tag, message);
            }
        }
    }

    public static void error(String tag, String message, Throwable throwable) {
        if (sLogLevel <= 6) {
            Logger logger = mCustomLogger;
            if (logger != null) {
                logger.log(Level.SEVERE, getMessageWithTag(tag, message), throwable);
            } else {
                Log.e(tag, message, throwable);
            }
        }
    }

    public static void logAssert(String tag, String message) {
        if (sLogLevel <= 7) {
            Log.println(7, tag, message);
        }
    }

    public static void logAssert(String tag, String message, Throwable throwable) {
        if (sLogLevel <= 7) {
            Log.println(7, tag, message + "\n" + Log.getStackTraceString(throwable));
        }
    }

    private static String getMessageWithTag(String tag, String message) {
        return String.format("%s: %s", tag, message);
    }
}
