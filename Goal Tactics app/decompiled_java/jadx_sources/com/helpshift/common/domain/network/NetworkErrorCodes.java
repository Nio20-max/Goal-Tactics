package com.helpshift.common.domain.network;

import androidx.constraintlayout.core.motion.utils.TypedValues;
import com.facebook.internal.FacebookRequestErrorClassification;
import com.google.firebase.messaging.ServiceStarter;
import com.helpshift.network.HttpStatus;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/* JADX INFO: loaded from: classes2.dex */
public interface NetworkErrorCodes {
    public static final Integer AUTH_TOKEN_NOT_PROVIDED;
    public static final Integer CONFLICT;
    public static final Integer CONTENT_NOT_FOUND;
    public static final Integer ENTITY_TOO_LARGE;
    public static final Integer EXPECTATION_FAILED;
    public static final Integer FAILED_DEPENDENCY;
    public static final Integer FORBIDDEN_ACCESS;
    public static final Integer GONE_ERROR;
    public static final Integer INVALID_AUTH_TOKEN;
    public static final Integer LOCKED;
    public static final Integer METHOD_NOT_ALLOWED;
    public static final Set<Integer> NOT_RETRIABLE_STATUS_CODES;
    public static final Integer NO_REQUEST_LENGTH;
    public static final Integer PARSE_ERROR;
    public static final Integer PAYMENT_REQUIRED;
    public static final Integer PRECONDITION_REQUIRED;
    public static final Integer PRE_CONDITION_NOT_MATCHED;
    public static final Integer RANGE_NOT_SATISFIABLE;
    public static final Integer REQUEST_HEADER_FIELDS_LARGE;
    public static final Integer REQUEST_TIMEOUT;
    public static final Integer SERVER_ERROR;
    public static final Integer TIMESTAMP_MISMATCH;
    public static final Integer UNAVAILABLE_LEGAL_REASONS;
    public static final Integer UNSUPPORTED_MEDIA_TYPE;
    public static final Integer UPGRADE_REQUIRED;
    public static final Integer URI_TOO_LONG;
    public static final Integer NO_CONNECTION = 0;
    public static final Integer GENERIC_NETWORK_ERROR = 1;
    public static final Integer SCREENSHOT_UPLOAD_ERROR = 2;
    public static final Integer UNKNOWN_HOST_ERROR = 3;
    public static final Integer SSL_PEER_UNVERIFIED_ERROR = 4;
    public static final Integer SSL_HANDSHAKE_ERROR = 5;
    public static final Integer PROCESSING_REQUEST = 102;
    public static final Integer OK = 200;
    public static final Integer CONTENT_UNCHANGED = 304;
    public static final Integer OBJECT_NOT_FOUND = 400;
    public static final Integer UNAUTHORIZED_ACCESS = 401;

    static {
        Integer numValueOf = Integer.valueOf(TypedValues.Cycle.TYPE_VISIBILITY);
        PAYMENT_REQUIRED = numValueOf;
        FORBIDDEN_ACCESS = 403;
        CONTENT_NOT_FOUND = 404;
        METHOD_NOT_ALLOWED = 405;
        PARSE_ERROR = 406;
        REQUEST_TIMEOUT = 408;
        CONFLICT = 409;
        GONE_ERROR = 410;
        NO_REQUEST_LENGTH = 411;
        Integer numValueOf2 = Integer.valueOf(FacebookRequestErrorClassification.EC_APP_NOT_INSTALLED);
        PRE_CONDITION_NOT_MATCHED = numValueOf2;
        Integer numValueOf3 = Integer.valueOf(HttpStatus.SC_REQUEST_TOO_LONG);
        ENTITY_TOO_LARGE = numValueOf3;
        URI_TOO_LONG = 414;
        UNSUPPORTED_MEDIA_TYPE = 415;
        Integer numValueOf4 = Integer.valueOf(TypedValues.Cycle.TYPE_PATH_ROTATE);
        RANGE_NOT_SATISFIABLE = numValueOf4;
        EXPECTATION_FAILED = 417;
        TIMESTAMP_MISMATCH = 422;
        Integer numValueOf5 = Integer.valueOf(TypedValues.Cycle.TYPE_WAVE_PERIOD);
        LOCKED = numValueOf5;
        Integer numValueOf6 = Integer.valueOf(TypedValues.Cycle.TYPE_WAVE_OFFSET);
        FAILED_DEPENDENCY = numValueOf6;
        UPGRADE_REQUIRED = 426;
        PRECONDITION_REQUIRED = 428;
        REQUEST_HEADER_FIELDS_LARGE = 431;
        AUTH_TOKEN_NOT_PROVIDED = 441;
        INVALID_AUTH_TOKEN = 443;
        UNAVAILABLE_LEGAL_REASONS = 451;
        SERVER_ERROR = Integer.valueOf(ServiceStarter.ERROR_UNKNOWN);
        NOT_RETRIABLE_STATUS_CODES = new HashSet(Arrays.asList(400, numValueOf, 403, 404, 405, 406, 409, 410, 411, numValueOf2, numValueOf3, 414, 415, numValueOf4, 417, numValueOf5, numValueOf6, 426, 428, 431, 451));
    }
}
