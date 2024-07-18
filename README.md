## E-Commerce App with Admin Panel

### Overview
Welcome to my **E-Commerce App with Admin Panel** built using **Flutter** and **Firebase**. This project demonstrates a complete e-commerce solution with features tailored for both admins and customers, ensuring a seamless and secure shopping experience.

### Features

#### Admin Side
- **Secure Login:** Admins can securely log in to access the dashboard.
- **Product Management:** Easily upload products with images, categorized for better organization.
- **Order Management:** View and manage orders, updating the status to keep customers informed.

#### Customer Side
- **Product Browsing:** Explore products by category or use a dynamic search bar, similar to Amazon and Flipkart.
- **Seamless Ordering:** Place orders with ease and track their status, from processing to delivery.
- **Profile Management:** View and edit profile, upload a profile image, log out, or delete the account.
- **Secure Payments:** Integrated Stripe for secure and reliable payment processing.

### Technologies and Packages Used
- **Flutter:** The main framework for building the app.
- **Curved Navigation Bar:** For smooth and intuitive page navigation.
- **Firebase Firestore:** Efficiently store and retrieve data in the cloud.
- **Firebase Authentication:** Secure login, sign-out, and account deletion.
- **Shared Preferences:** Local storage of user data for quick access.
- **Image Picker:** Select images from the device gallery.
- **Firebase Storage:** Cloud storage for product and profile images.
- **Flutter Stripe:** Secure payment gateway integration.
- **HTTP:** Handle network requests seamlessly.

### Installation

1. **Clone the repository:**
   ```sh
   git clone https://github.com/yourusername/ecommerce-app.git
   cd ecommerce-app
   ```

2. **Install dependencies:**
   ```sh
   flutter pub get
   ```

3. **Set up Firebase:**
   - Go to the [Firebase Console](https://console.firebase.google.com/).
   - Create a new project.
   - Add an Android app and download the `google-services.json` file.
   - Add an iOS app and download the `GoogleService-Info.plist` file.
   - Place these files in their respective directories in your Flutter project.

4. **Run the app:**
   ```sh
   flutter run
   ```

### Usage

- **Admin Login:** Use the admin credentials to log in and access the admin panel.
- **Product Management:** Add products with images and categorize them for better organization.
- **Order Management:** View orders and update their status.
- **Customer Interaction:** Customers can browse, search, and place orders. They can also manage their profiles and make secure payments.

### Screenshots

<table style="width: 100%; border-collapse: separate; border-spacing: 10px;">
  <tr>
    <td style="text-align: center; width: 100%;">
      <strong>Onboarding page:</strong><br>
      <img src="https://github.com/user-attachments/assets/b6867589-9775-481f-8d5b-dacea02e00ea" alt="Onboarding page" width="200" height="400" />
    </td>
  </tr>
  <tr>
    <td style="text-align: center; width: 100%;">
      <strong>Home page:</strong><br>
      <img src="https://github.com/user-attachments/assets/e1c4478b-c279-435c-8779-f9ec61fe7d59" alt="Home page" width="200" height="400" />
    </td>
  </tr>
  <tr>
    <td style="text-align: center; width: 100%;">
      <strong>Additional Screenshot:</strong><br>
      <img src="https://github.com/user-attachments/assets/fc008fd9-5dae-46cf-a4e0-99946f5bff06" alt="WhatsApp Image 2024-07-19 at 1 28 25 AM" width="200" height="400" />
    </td>
  </tr>
  <tr>
    <td style="text-align: center; width: 100%;">
      <strong>Product page:</strong><br>
      <img src="https://github.com/user-attachments/assets/ddbc9c2a-30c8-4b65-b6d6-d90cecaf9ab5" alt="Product page" width="200" height="400" />
    </td>
  </tr>
  <tr>
    <td style="text-align: center; width: 100%;">
      <strong>Product detail page:</strong><br>
      <img src="https://github.com/user-attachments/assets/ddfce5c3-7737-4352-a8d6-0f8221cd6009" alt="Product detail page" width="200" height="400" />
    </td>
  </tr>
  <tr>
    <td style="text-align: center; width: 100%;">
      <strong>Payment gateway:</strong><br>
      <img src="https://github.com/user-attachments/assets/afa69715-e300-4464-9b0c-954669f4eeb7" alt="Payment gateway" width="200" height="400" />
    </td>
  </tr>
  <tr>
    <td style="text-align: center; width: 100%;">
      <strong>Current Orders page:</strong><br>
      <img src="https://github.com/user-attachments/assets/c9bcff11-a38b-43af-b0ae-a0471cb43039" alt="Current Orders page" width="200" height="400" />
    </td>
  </tr>
  <tr>
    <td style="text-align: center; width: 100%;">
      <strong>Profile Page:</strong><br>
      <img src="https://github.com/user-attachments/assets/92c60efe-ba9f-4c65-b0a4-a03459540d7b" alt="Profile Page" width="200" height="400" />
    </td>
  </tr>
  <tr>
    <td style="text-align: center; width: 100%;">
      <strong>Admin Dashboard:</strong><br>
      <img src="https://github.com/user-attachments/assets/3c37cb68-adf1-4e46-b39f-d6a1bf27e031" alt="Admin Dashboard" width="200" height="400" />
    </td>
  </tr>
  <tr>
    <td style="text-align: center; width: 100%;">
      <strong>Product Upload Page:</strong><br>
      <img src="https://github.com/user-attachments/assets/6f53f59d-00d7-462a-acf5-a9bfc1b6c28e" alt="Product Upload Page" width="200" height="400" />
    </td>
  </tr>
  <tr>
    <td style="text-align: center; width: 100%;">
      <strong>View Placed Orders Page:</strong><br>
      <img src="https://github.com/user-attachments/assets/8ab12ee0-ce29-4c1f-a9ce-7428abb37438" alt="View Placed Orders Page" width="200" height="400" />
    </td>
  </tr>
</table>


<!--
#### Desktop Layout:
<table style="width: 100%; border-collapse: separate; border-spacing: 10px;">
  <tr>
    <td style="text-align: center; width: 25%;">
      <strong>Onboarding page:</strong><br>
      <img src="https://github.com/user-attachments/assets/b6867589-9775-481f-8d5b-dacea02e00ea" alt="Onboarding page" width="200" height="400" />
    </td>
    <td style="text-align: center; width: 25%;">
      <strong>Home page:</strong><br>
      <img src="https://github.com/user-attachments/assets/e1c4478b-c279-435c-8779-f9ec61fe7d59" alt="Home page" width="200" height="400" />
    </td>
    <td style="text-align: center; width: 25%;">
      <strong>Product page:</strong><br>
      <img src="https://github.com/user-attachments/assets/ddbc9c2a-30c8-4b65-b6d6-d90cecaf9ab5" alt="Product page" width="200" height="400" />
    </td>
    <td style="text-align: center; width: 25%;">
      <strong>Product detail page:</strong><br>
      <img src="https://github.com/user-attachments/assets/ddfce5c3-7737-4352-a8d6-0f8221cd6009" alt="Product detail page" width="200" height="400" />
    </td>
  </tr>
  <tr>
    <td style="text-align: center; width: 25%;">
      <strong>Payment gateway:</strong><br>
      <img src="https://github.com/user-attachments/assets/afa69715-e300-4464-9b0c-954669f4eeb7" alt="Payment gateway" width="200" height="400" />
    </td>
    <td style="text-align: center; width: 25%;">
      <strong>Current Orders page:</strong><br>
      <img src="https://github.com/user-attachments/assets/c9bcff11-a38b-43af-b0ae-a0471cb43039" alt="Current Orders page" width="200" height="400" />
    </td>
    <td style="text-align: center; width: 25%;">
      <strong>Profile Page:</strong><br>
      <img src="https://github.com/user-attachments/assets/92c60efe-ba9f-4c65-b0a4-a03459540d7b" alt="Profile Page" width="200" height="400" />
    </td>
    <td style="text-align: center; width: 25%;">
      <strong>Admin Dashboard:</strong><br>
      <img src="https://github.com/user-attachments/assets/3c37cb68-adf1-4e46-b39f-d6a1bf27e031" alt="Admin Dashboard" width="200" height="400" />
    </td>
  </tr>
  <tr>
    <td style="text-align: center; width: 25%;">
      <strong>Product Upload Page:</strong><br>
      <img src="https://github.com/user-attachments/assets/6f53f59d-00d7-462a-acf5-a9bfc1b6c28e" alt="Product Upload Page" width="200" height="400" />
    </td>
    <td style="text-align: center; width: 25%;">
      <strong>View Placed Orders Page:</strong><br>
      <img src="https://github.com/user-attachments/assets/8ab12ee0-ce29-4c1f-a9ce-7428abb37438" alt="View Placed Orders Page" width="200" height="400" />
    </td>
    <td colspan="2" style="text-align: center; width: 50%;">
      <!-- Empty cell for alignment -- less than sign here
    </td>
  </tr>
</table>
-->

Thank you for checking out my project! 🚀
