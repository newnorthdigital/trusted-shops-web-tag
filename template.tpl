___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Trusted Shops Tag",
  "categories": [
    "CONVERSIONS",
    "MARKETING"
  ],
  "brand": {
    "id": "brand_dummy",
    "displayName": "New North Digital",
    "thumbnail": ""
  },
  "description": "Trusted Shops Trustbadge integration. Load the Trustbadge widget on all pages with configurable variant, position, and display options.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "trustedshopsId",
    "displayName": "Trusted Shops ID",
    "simpleValueType": true,
    "help": "Your 33-character Trusted Shops ID (starting with X...) from the My Trusted Shops dashboard.",
    "alwaysInSummary": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "badgeConfig",
    "displayName": "Badge Configuration",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "SELECT",
        "name": "badgeVariant",
        "displayName": "Variant",
        "macrosInSelect": false,
        "selectItems": [
          { "value": "reviews", "displayValue": "Reviews (default)" },
          { "value": "default", "displayValue": "Default" },
          { "value": "custom", "displayValue": "Custom" },
          { "value": "custom_reviews", "displayValue": "Custom with reviews" }
        ],
        "simpleValueType": true,
        "defaultValue": "reviews"
      },
      {
        "type": "TEXT",
        "name": "badgeYOffset",
        "displayName": "Y-Offset (px)",
        "simpleValueType": true,
        "defaultValue": "0",
        "help": "Vertical offset from the bottom of the screen in pixels."
      },
      {
        "type": "TEXT",
        "name": "customElementId",
        "displayName": "Custom Element ID",
        "simpleValueType": true,
        "help": "Required for custom and custom_reviews variants.",
        "enablingConditions": [
          { "paramName": "badgeVariant", "paramValue": "custom", "type": "EQUALS" },
          { "paramName": "badgeVariant", "paramValue": "custom_reviews", "type": "EQUALS" }
        ]
      },
      {
        "type": "SELECT",
        "name": "trustcardDirection",
        "displayName": "Trustcard Direction",
        "macrosInSelect": false,
        "selectItems": [
          { "value": "", "displayValue": "Auto" },
          { "value": "topRight", "displayValue": "Top Right" },
          { "value": "topLeft", "displayValue": "Top Left" },
          { "value": "bottomRight", "displayValue": "Bottom Right" },
          { "value": "bottomLeft", "displayValue": "Bottom Left" }
        ],
        "simpleValueType": true,
        "defaultValue": ""
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "debugging",
    "displayName": "Debugging",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "CHECKBOX",
        "name": "debug",
        "checkboxText": "Log debug messages to console",
        "simpleValueType": true
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

var log = require('logToConsole');
var injectScript = require('injectScript');
var setInWindow = require('setInWindow');
var makeString = require('makeString');

var enableDebug = data.debug;
var debugLog = function(msg) {
  if (enableDebug) log('Trusted Shops GTM - ' + msg);
};

var tsId = makeString(data.trustedshopsId);

debugLog('Loading Trustbadge for TSID: ' + tsId);

// Build _tsConfig from badge settings
var tsConfig = {
  'yOffset': makeString(data.badgeYOffset || '0'),
  'variant': makeString(data.badgeVariant || 'reviews'),
  'customElementId': makeString(data.customElementId || ''),
  'trustcardDirection': makeString(data.trustcardDirection || ''),
  'disableResponsive': 'false',
  'disableTrustbadge': 'false'
};

setInWindow('_tsConfig', tsConfig, true);
debugLog('Set _tsConfig');

var scriptUrl = 'https://widgets.trustedshops.com/js/' + tsId + '.js';

injectScript(scriptUrl, function() {
  debugLog('Trustbadge script loaded');
  data.gtmOnSuccess();
}, function() {
  debugLog('Trustbadge script failed to load');
  data.gtmOnFailure();
}, 'trustedShopsBadge_' + tsId);


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://widgets.trustedshops.com/js/*"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "_tsConfig"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios:
- name: Place badge - script injected
  code: |-
    const mockData = {
      actionType: 'placeBadge',
      trustedshopsId: 'X1234567890123456789012345678901AB',
      badgeVariant: 'reviews',
      badgeYOffset: '0',
      customElementId: '',
      trustcardDirection: '',
      debug: false
    };

    mock('injectScript', function(url, onSuccess, onFailure, cacheToken) {
      onSuccess();
    });

    runCode(mockData);
    assertApi('gtmOnSuccess').wasCalled();
- name: Shop reviews - gtmOnSuccess called
  code: |-
    const mockData = {
      actionType: 'shopReviews',
      trustedshopsId: 'X1234567890123456789012345678901AB',
      orderNumber: '12345',
      buyerEmail: 'test@example.com',
      orderAmount: '99.99',
      orderCurrency: 'EUR',
      orderPaymentType: 'PAYPAL',
      debug: false
    };

    mock('callInWindow', function() { return {}; });
    mock('setInWindow', function() {});
    mock('copyFromWindow', function() { return undefined; });

    runCode(mockData);
    assertApi('gtmOnSuccess').wasCalled();
- name: Script failure
  code: |-
    const mockData = {
      actionType: 'placeBadge',
      trustedshopsId: 'X1234567890123456789012345678901AB',
      badgeVariant: 'reviews',
      badgeYOffset: '0',
      debug: false
    };

    mock('injectScript', function(url, onSuccess, onFailure, cacheToken) {
      onFailure();
    });

    runCode(mockData);
    assertApi('gtmOnFailure').wasCalled();


___NOTES___

Created on 2025-01-01 by New North Digital (newnorth.digital).
