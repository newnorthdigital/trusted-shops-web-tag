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
  "description": "Trusted Shops Trustbadge integration. Place the Trustbadge on all pages and collect shop and product reviews on the order confirmation page.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "SELECT",
    "name": "actionType",
    "displayName": "Action type",
    "macrosInSelect": false,
    "selectItems": [
      {
        "value": "placeBadge",
        "displayValue": "Place Trustbadge"
      },
      {
        "value": "shopReviews",
        "displayValue": "Collect shop reviews"
      },
      {
        "value": "shopProductReviews",
        "displayValue": "Collect shop and product reviews"
      }
    ],
    "simpleValueType": true,
    "help": "Select the action this tag should perform. Use separate tags for badge placement (all pages) and review collection (order confirmation)."
  },
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
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "SELECT",
        "name": "badgeVariant",
        "displayName": "Variant",
        "macrosInSelect": false,
        "selectItems": [
          {
            "value": "reviews",
            "displayValue": "Reviews (default)"
          },
          {
            "value": "default",
            "displayValue": "Default"
          },
          {
            "value": "custom",
            "displayValue": "Custom"
          },
          {
            "value": "custom_reviews",
            "displayValue": "Custom with reviews"
          }
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
          {
            "paramName": "badgeVariant",
            "paramValue": "custom",
            "type": "EQUALS"
          },
          {
            "paramName": "badgeVariant",
            "paramValue": "custom_reviews",
            "type": "EQUALS"
          }
        ]
      },
      {
        "type": "SELECT",
        "name": "trustcardDirection",
        "displayName": "Trustcard Direction",
        "macrosInSelect": false,
        "selectItems": [
          {
            "value": "",
            "displayValue": "Auto"
          },
          {
            "value": "topRight",
            "displayValue": "Top Right"
          },
          {
            "value": "topLeft",
            "displayValue": "Top Left"
          },
          {
            "value": "bottomRight",
            "displayValue": "Bottom Right"
          },
          {
            "value": "bottomLeft",
            "displayValue": "Bottom Left"
          }
        ],
        "simpleValueType": true,
        "defaultValue": ""
      }
    ],
    "enablingConditions": [
      {
        "paramName": "actionType",
        "paramValue": "placeBadge",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "orderData",
    "displayName": "Order Data",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "TEXT",
        "name": "orderNumber",
        "displayName": "Order Number",
        "simpleValueType": true,
        "help": "Unique order number or timestamp."
      },
      {
        "type": "TEXT",
        "name": "buyerEmail",
        "displayName": "Buyer Email",
        "simpleValueType": true,
        "help": "Customer email address for review invitation."
      },
      {
        "type": "TEXT",
        "name": "orderAmount",
        "displayName": "Order Amount",
        "simpleValueType": true,
        "help": "Order total (e.g., 150.00)."
      },
      {
        "type": "TEXT",
        "name": "orderCurrency",
        "displayName": "Currency",
        "simpleValueType": true,
        "defaultValue": "EUR",
        "help": "ISO currency code (EUR, GBP, USD, etc.)."
      },
      {
        "type": "TEXT",
        "name": "orderPaymentType",
        "displayName": "Payment Type",
        "simpleValueType": true,
        "help": "Payment method (e.g., PAYPAL, PREPAYMENT)."
      },
      {
        "type": "TEXT",
        "name": "orderEstDeliveryDate",
        "displayName": "Est. Delivery Date (optional)",
        "simpleValueType": true,
        "help": "Format: YYYY-MM-DD."
      }
    ],
    "enablingConditions": [
      {
        "paramName": "actionType",
        "paramValue": "shopReviews",
        "type": "EQUALS"
      },
      {
        "paramName": "actionType",
        "paramValue": "shopProductReviews",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "productData",
    "displayName": "Product Data",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "TEXT",
        "name": "productsVariable",
        "displayName": "Products Variable",
        "simpleValueType": true,
        "help": "A GTM variable that returns an array of product objects. Each object should have: url, imageUrl, name, sku, and optionally gtin, mpn, brand."
      }
    ],
    "enablingConditions": [
      {
        "paramName": "actionType",
        "paramValue": "shopProductReviews",
        "type": "EQUALS"
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
var copyFromWindow = require('copyFromWindow');
var setInWindow = require('setInWindow');
var callInWindow = require('callInWindow');
var makeString = require('makeString');
var getType = require('getType');

var enableDebug = data.debug;
var debugLog = function(msg) {
  if (enableDebug) log('Trusted Shops GTM - ' + msg);
};

var tsId = makeString(data.trustedshopsId);
var actionType = data.actionType;

debugLog('Action: ' + actionType + ', TSID: ' + tsId);

// HTML escape helper
var escapeHtml = function(str) {
  if (!str) return '';
  str = makeString(str);
  var result = '';
  for (var i = 0; i < str.length; i++) {
    var ch = str.charAt(i);
    if (ch === '&') result = result + '&amp;';
    else if (ch === '<') result = result + '&lt;';
    else if (ch === '>') result = result + '&gt;';
    else if (ch === '"') result = result + '&quot;';
    else result = result + ch;
  }
  return result;
};

if (actionType === 'placeBadge') {
  // Build _tsConfig
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

} else if (actionType === 'shopReviews' || actionType === 'shopProductReviews') {
  // Build checkout DIV HTML
  var html = '';
  html = html + '<span id="tsCheckoutOrderNr">' + escapeHtml(data.orderNumber) + '</span>';
  html = html + '<span id="tsCheckoutBuyerEmail">' + escapeHtml(data.buyerEmail) + '</span>';
  html = html + '<span id="tsCheckoutOrderAmount">' + escapeHtml(data.orderAmount) + '</span>';
  html = html + '<span id="tsCheckoutOrderCurrency">' + escapeHtml(data.orderCurrency) + '</span>';
  html = html + '<span id="tsCheckoutOrderPaymentType">' + escapeHtml(data.orderPaymentType) + '</span>';

  if (data.orderEstDeliveryDate) {
    html = html + '<span id="tsCheckoutOrderEstDeliveryDate">' + escapeHtml(data.orderEstDeliveryDate) + '</span>';
  }

  // Add product data if collecting product reviews
  if (actionType === 'shopProductReviews' && data.productsVariable) {
    var products = data.productsVariable;
    if (getType(products) === 'array') {
      for (var i = 0; i < products.length; i++) {
        var p = products[i];
        html = html + '<span class="tsCheckoutProductItem">';
        if (p.url) html = html + '<span class="tsCheckoutProductUrl">' + escapeHtml(p.url) + '</span>';
        if (p.imageUrl) html = html + '<span class="tsCheckoutProductImageUrl">' + escapeHtml(p.imageUrl) + '</span>';
        if (p.name) html = html + '<span class="tsCheckoutProductName">' + escapeHtml(p.name) + '</span>';
        if (p.sku) html = html + '<span class="tsCheckoutProductSKU">' + escapeHtml(p.sku) + '</span>';
        if (p.gtin) html = html + '<span class="tsCheckoutProductGTIN">' + escapeHtml(p.gtin) + '</span>';
        if (p.mpn) html = html + '<span class="tsCheckoutProductMPN">' + escapeHtml(p.mpn) + '</span>';
        if (p.brand) html = html + '<span class="tsCheckoutProductBrand">' + escapeHtml(p.brand) + '</span>';
        html = html + '</span>';
      }
    }
  }

  debugLog('Checkout HTML built');

  // Store checkout HTML in window for the inline script to read
  setInWindow('__tsCheckoutHtml', html, true);

  // Inject an inline script via data: URI to create the checkout DIV
  // GTM sandbox cannot access document.* directly, so we use injectScript
  // with a data: URI that runs in the page context
  var encodeUriComponent = require('encodeUriComponent');
  var helperCode = 'var e=document.getElementById("trustedShopsCheckout");if(e)e.parentNode.removeChild(e);var d=document.createElement("div");d.id="trustedShopsCheckout";d.style.display="none";d.innerHTML=window.__tsCheckoutHtml||"";document.body.appendChild(d);delete window.__tsCheckoutHtml;';
  var dataUri = 'data:text/javascript,' + encodeUriComponent(helperCode);

  injectScript(dataUri, function() {
    debugLog('Checkout DIV appended to DOM');

    // Reinitialize Trustbadge if already loaded
    var tb = copyFromWindow('trustbadge');
    if (tb) {
      callInWindow('trustbadge.remove');
      callInWindow('trustbadge.reInitialize');
      debugLog('Trustbadge reinitialized');
    }

    data.gtmOnSuccess();
  }, function() {
    debugLog('Failed to create checkout DIV');
    data.gtmOnFailure();
  }, 'tsCheckoutDiv');
} else {
  debugLog('Unknown action type');
  data.gtmOnFailure();
}


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
              },
              {
                "type": 1,
                "string": "data:text/javascript*"
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
              },
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
                    "string": "trustbadge"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              },
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
                    "string": "trustbadge.remove"
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
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
                    "string": "trustbadge.reInitialize"
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  { "type": 1, "string": "key" },
                  { "type": 1, "string": "read" },
                  { "type": 1, "string": "write" },
                  { "type": 1, "string": "execute" }
                ],
                "mapValue": [
                  { "type": 1, "string": "__tsCheckoutHtml" },
                  { "type": 8, "boolean": false },
                  { "type": 8, "boolean": true },
                  { "type": 8, "boolean": false }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  { "type": 1, "string": "key" },
                  { "type": 1, "string": "read" },
                  { "type": 1, "string": "write" },
                  { "type": 1, "string": "execute" }
                ],
                "mapValue": [
                  { "type": 1, "string": "__tsCreateCheckoutDiv" },
                  { "type": 8, "boolean": false },
                  { "type": 8, "boolean": true },
                  { "type": 8, "boolean": true }
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
