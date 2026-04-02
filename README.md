# Trusted Shops - GTM Tag Template

Integrate the Trusted Shops Trustbadge and collect shop and product reviews via Google Tag Manager — without writing Custom HTML tags.

Developed by [New North Digital](https://newnorth.digital?utm_source=github&utm_medium=gtm-template&utm_campaign=trusted-shops-web-tag).

## Features

This template supports three action types:

1. **Place Trustbadge** — Load the Trustbadge script on all pages of your shop. Configurable variant, position, offset, and mobile settings.
2. **Collect Shop Reviews** — Create the checkout data element on your order confirmation page to enable review invitations and Buyer Protection.
3. **Collect Shop & Product Reviews** — Same as above, plus product-level review data for Google Shopping integration.

## Setup

### Step 1: Place the Trustbadge (All Pages)

1. Create a new tag using this template
2. Set **Action Type** to "Place Trustbadge"
3. Enter your **Trusted Shops ID** (33-character ID starting with X, found in your My Trusted Shops dashboard)
4. Configure badge settings as needed (variant, position, offset)
5. Set the trigger to **All Pages**

### Step 2: Collect Reviews (Order Confirmation Page)

1. Create another tag using this template
2. Set **Action Type** to "Collect shop reviews" (or "Collect shop and product reviews" if applicable)
3. Enter the same **Trusted Shops ID**
4. Fill in the order data fields using GTM variables:
   - **Order Number**: e.g. `{{dlv - order_id}}`
   - **Buyer Email**: e.g. `{{dlv - customer_email}}`
   - **Order Amount**: e.g. `{{dlv - order_total}}`
   - **Order Currency**: e.g. `EUR`
   - **Payment Type**: e.g. `{{dlv - payment_method}}`
5. If collecting product reviews, pass product data via a GTM variable
6. Set the trigger to fire only on the **Order Confirmation Page**

## Badge Configuration

| Setting | Description | Default |
|---------|-------------|---------|
| Variant | Display mode: reviews, default, custom, custom_reviews | reviews |
| Y-Offset | Vertical offset from screen bottom (px) | 0 |
| Custom Element ID | Target element for custom variants | (empty) |
| Trustcard Direction | Popup direction for custom variants | Auto |

## Product Review Data

When collecting product reviews, provide a GTM variable returning an array of product objects:

```javascript
[
  {
    url: "https://shop.com/product1",
    imageUrl: "https://shop.com/image1.png",
    name: "Product Name",
    sku: "SKU123",
    gtin: "4001234567890",  // recommended
    mpn: "MPN123",          // optional
    brand: "BrandName"      // recommended
  }
]
```

## Permissions

- **Inject Scripts**: `https://widgets.trustedshops.com/js/*`
- **Access Globals**: Read/write for Trustbadge configuration and checkout data DOM creation
- **Logging**: Console logging in debug mode

## Resources

- [Trusted Shops GTM Documentation](https://help.etrusted.com/hc/en-gb/articles/23970857991570)
- [Trustbadge Integration Guide](https://help.etrusted.com/hc/en-gb/articles/23970875894034)
- [Product Reviews Setup](https://help.etrusted.com/hc/en-gb/articles/23970820829074)

## Author

Created by [New North Digital](https://newnorth.digital?utm_source=github&utm_medium=gtm-template&utm_campaign=trusted-shops-web-tag)

## License

Apache 2.0 — see [LICENSE](LICENSE).
