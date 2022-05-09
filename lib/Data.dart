import 'package:flutter/material.dart';
import 'package:store/models/Order.dart';

import 'models/Article.dart';
import 'models/Category.dart';
import 'models/DiscountArticles.dart';
import 'models/Notification.dart';
import 'models/PaymentMethod.dart';
import 'models/ShippingMethod.dart';

class Data{


  //These are exemples used in the app, replace them with your data


  static String profileImage='https://1.bp.blogspot.com/-JIIMmNSsEjg/XqLmxtIwTtI/AAAAAAAABbg/CzEf_8CxOgAq8UxwuDq1ngIknHA2OeN2gCLcBGAsYHQ/s320/profile.png';
  static List<ShippingMethod> shippingMethods = [
    ShippingMethod(title: 'DHL', image: 'images/dhl.jpg'),
    ShippingMethod(title: 'Aramex', image: 'images/aramex.jpg'),
    ShippingMethod(title: 'EMS', image: 'images/ems.jpg')
  ];
  static List<PaymentMethod> paymentMethods = [
    PaymentMethod(title: 'VISA', image: 'images/visa.jpg'),
    PaymentMethod(title: 'MASTER CARD', image: 'images/mastercard.jpg'),
    PaymentMethod(title: 'PAYPAL', image: 'images/paypal.jpg')
  ];
  static List<Article> cartArticles = [
    Article(

      quatity: 4,
      title:'Table NARDI Rodi Tartoura',
      label:'Tables',
      price:55.99,
      brand:'Mades Tartoura',
      image:['https://1.bp.blogspot.com/-dHeFkXljcKw/XryZPnjmjmI/AAAAAAAAGpU/tR-HySF57lkcf1hTbfhSWpABXrKQPD0yQCLcBGAsYHQ/s320/GUEST_fa339f39-08f8-4412-bbe6-3c091748f717.jpg',
        'https://1.bp.blogspot.com/-6s4uTR7W05Y/XryZZ5ebjTI/AAAAAAAAGpY/-4rJoJ6tEo459NIp2Na3B0jI8im_nda8ACLcBGAsYHQ/s320/1565607715_3931.jpg',
        'https://1.bp.blogspot.com/-dHeFkXljcKw/XryZPnjmjmI/AAAAAAAAGpU/tR-HySF57lkcf1hTbfhSWpABXrKQPD0yQCLcBGAsYHQ/s320/GUEST_fa339f39-08f8-4412-bbe6-3c091748f717.jpg',],
      description:'Due to increased demand, we temporarily have reduced product selection available for delivery to your region. We are working to improve selection availability as soon as possible.',
      colors: [
        Colors.brown,
        Colors.yellow,
        Colors.blueGrey,
        Colors.orange,
        Colors.green
      ],
      size: 'H:100cm W:300cm',
      favourite: 0,
      link:'https://codecanyon.net/item/flutter-ecommerce-ui/26541471',



    ),
    Article(

      quatity: 8,
      title:'AmazonBasics Mesh, Mid-Back, Adjustable, Swivel Office Desk Chair',
      label:'Chairs',
      price:14.6,
      brand:'Amazon Fournitures',
      image:['https://1.bp.blogspot.com/-6s4uTR7W05Y/XryZZ5ebjTI/AAAAAAAAGpY/-4rJoJ6tEo459NIp2Na3B0jI8im_nda8ACLcBGAsYHQ/s320/1565607715_3931.jpg',
        'https://1.bp.blogspot.com/-6s4uTR7W05Y/XryZZ5ebjTI/AAAAAAAAGpY/-4rJoJ6tEo459NIp2Na3B0jI8im_nda8ACLcBGAsYHQ/s320/1565607715_3931.jpg',
        'https://1.bp.blogspot.com/-dHeFkXljcKw/XryZPnjmjmI/AAAAAAAAGpU/tR-HySF57lkcf1hTbfhSWpABXrKQPD0yQCLcBGAsYHQ/s320/GUEST_fa339f39-08f8-4412-bbe6-3c091748f717.jpg',],
      description:'Due to increased demand, we temporarily have reduced product selection available for delivery to your region. We are working to improve selection availability as soon as possible.',
      colors: [
        Colors.brown,
        Colors.yellow,
        Colors.blueGrey,
        Colors.orange,
        Colors.green
      ],
      size: 'H:100cm W:300cm',
      favourite: 1,
      link:'https://codecanyon.net/item/flutter-ecommerce-ui/26541471',



    ),

  ];

  static List<DiscountArticles> discount = [
    DiscountArticles(
        title:'Sofa',
        image:'https://1.bp.blogspot.com/-AY35WdYr1MQ/XqLoPw8bhHI/AAAAAAAABcY/scdYCBEbREoCNLN3CnNho-VU3DnEopnlwCLcBGAsYHQ/s400/chairPhoto.jpg',
        article: articles[3]
    ),
    DiscountArticles(
        title:'Chair',
        image:'https://1.bp.blogspot.com/-UPzp6fsSUPw/XqLoPS859MI/AAAAAAAABcQ/dkWEspEg7HwBmL-orFxkSM6f13gfmAVaACLcBGAsYHQ/s400/sofaPhoto.jpg',
      article: articles[1]

    ),
    DiscountArticles(
        title:'Table',
        image:'https://1.bp.blogspot.com/-sbtwe8_IV1M/XqLoPvpArSI/AAAAAAAABcU/bX-iqARBnkAgC4dd5HCJZx4pz_RwCRG3wCLcBGAsYHQ/s400/tablePhoto.jpg',
      article: articles[7]
    )

  ];


  static List<Order> orders=[
    Order(

      id: '12345677',
      date: '10-04-2019',
      tracking_number: 'RK12394539',
      quantity: cartArticles.length,
      price: 150,
      articles: cartArticles,
      shippingAddress: 'First zone, Tunisia, 4135',
      paymentMethod: 'Mastercard',
      deliveryMethod: 'Aramex',
      status: 'Delivered',


    ),
    Order(

      id: '12345677',
      date: '10-04-2019',
      tracking_number: 'RK12394539',
      quantity: cartArticles.length,
      price: 150,
      articles: cartArticles,
      shippingAddress: 'First zone, Tunisia, 4135',
      paymentMethod: 'Mastercard',
      deliveryMethod: 'Aramex',
      status: 'In Process',


    ),
    Order(

      id: '12345677',
      date: '10-04-2019',
      tracking_number: 'RK12394539',
      quantity: cartArticles.length,
      price: 150,
      articles: cartArticles,
      shippingAddress: 'First zone, Tunisia, 4135',
      paymentMethod: 'Mastercard',
      deliveryMethod: 'Aramex',
      status: 'In Process',


    ),
    Order(

      id: '12345677',
      date: '10-04-2019',
      tracking_number: 'RK12394539',
      quantity: cartArticles.length,
      price: 150,
      articles: cartArticles,
      shippingAddress: 'First zone, Tunisia, 4135',
      paymentMethod: 'Mastercard',
      deliveryMethod: 'Aramex',
      status: 'Delivered',


    ),
    Order(

      id: '12345677',
      date: '10-04-2019',
      tracking_number: 'RK12394539',
      quantity: cartArticles.length,
      price: 150,
      articles: cartArticles,
      shippingAddress: 'First zone, Tunisia, 4135',
      paymentMethod: 'Mastercard',
      deliveryMethod: 'Aramex',
      status: 'In Process',


    ),
    Order(

      id: '12345677',
      date: '10-04-2019',
      tracking_number: 'RK12394539',
      quantity: cartArticles.length,
      price: 150,
      articles: cartArticles,
      shippingAddress: 'First zone, Tunisia, 4135',
      paymentMethod: 'Mastercard',
      deliveryMethod: 'Aramex',
      status: 'Delivered',


    ),
    Order(

      id: '12345677',
      date: '10-04-2019',
      tracking_number: 'RK12394539',
      quantity: cartArticles.length,
      price: 150,
      articles: cartArticles,
      shippingAddress: 'First zone, Tunisia, 4135',
      paymentMethod: 'Mastercard',
      deliveryMethod: 'Aramex',
      status: 'Delivered',


    ),
    Order(

      id: '12345677',
      date: '10-04-2019',
      tracking_number: 'RK12394539',
      quantity: cartArticles.length,
      price: 150,
      articles: cartArticles,
      shippingAddress: 'First zone, Tunisia, 4135',
      paymentMethod: 'Mastercard',
      deliveryMethod: 'Aramex',
      status: 'In Process',


    ),
    Order(

      id: '12345677',
      date: '10-04-2019',
      tracking_number: 'RK12394539',
      quantity: cartArticles.length,
      price: 150,
      articles: cartArticles,
      shippingAddress: 'First zone, Tunisia, 4135',
      paymentMethod: 'Mastercard',
      deliveryMethod: 'Aramex',
      status: 'In Process',


    ),
  ];

  static List listOfImages=[
    'images/shoppingDone.jpg',
    'images/logo.png',
    'images/back.png',
    'images/fb.png',
    'images/google.png',
    'images/twitter.png',
    'images/tick.png',
    'images/exclamation.png',
    'images/carpet.png',
    'images/chair.png',
    'images/dresser.png',
    'images/table.png',
    'images/sofa.png',
    'images/background.png',
    'images/dhl.jpg',
    'images/ems.jpg',
    'images/aramex.jpg',
    'images/paypal.jpg',
    'images/mastercard.jpg',
    'images/visa.jpg',
    'images/shipping.png',
    'images/payment.png',
    'images/furniture.png',
    'images/shoppingDone.jpg',
    'images/emptyCart.png',

  ];
  static List listOfNetworkImages=[
    'https://1.bp.blogspot.com/-JIIMmNSsEjg/XqLmxtIwTtI/AAAAAAAABbg/CzEf_8CxOgAq8UxwuDq1ngIknHA2OeN2gCLcBGAsYHQ/s320/profile.png',
    'https://cdn.wallpaper.com/main/styles/wp_large/s3/legacy/whouse/ac2/1441387758_Ricardo_Casas.jpg',
  ];



  static List<Notif> notifications = [
    Notif(title: 'The purchase was successful', image: 'images/tick.png'),
    Notif(
        title: 'Please select the shipping type',
        description: 'Add more adress',
        image: 'images/exclamation.png'),
    Notif(title: 'The purchase was successful', image: 'images/tick.png'),
    Notif(title: 'The purchase was successful', image: 'images/tick.png'),
    Notif(
        title: 'Please select the shipping type',
        description: 'Add more adress',
        image: 'images/exclamation.png'),
    Notif(title: 'The purchase was successful', image: 'images/tick.png'),
    Notif(
        title: 'Please select the shipping type',
        description: 'Add more adress',
        image: 'images/exclamation.png'),
    Notif(title: 'The purchase was successful', image: 'images/tick.png'),
    Notif(title: 'The purchase was successful', image: 'images/tick.png'),
    Notif(title: 'The purchase was successful', image: 'images/tick.png'),
    Notif(
        title: 'Please select the shipping type',
        description: 'Add more adress',
        image: 'images/exclamation.png'),
    Notif(
        title: 'Please select the shipping type',
        description: 'Add more adress',
        image: 'images/exclamation.png'),
    Notif(
        title: 'Please select the shipping type',
        description: 'Add more adress',
        image: 'images/exclamation.png'),
  ];

  static List<Category> categories = [
    Category('Sofas', 'images/sofa.png'),
    Category('Chairs', 'images/chair.png'),
    Category('Tables', 'images/table.png'),
    Category('Dressers', 'images/dresser.png'),
    Category('Carpets', 'images/carpet.png')
  ];

  static List<Article> top = [
    Article(
      quatity: 0,
      title:'Coco Dining Table',
      label:'Tables',
      price:155.02,
      brand:'Life Interiors',
      image:['https://1.bp.blogspot.com/-vljndkENB8I/XryjDKKKbRI/AAAAAAAAGrE/UV6H9Ynz7i4BLBwtRGykk_HtKaOnaT2hQCLcBGAsYHQ/s320/dt-hal-coco-ash-70cm_1.jpg',
        'https://1.bp.blogspot.com/-6s4uTR7W05Y/XryZZ5ebjTI/AAAAAAAAGpY/-4rJoJ6tEo459NIp2Na3B0jI8im_nda8ACLcBGAsYHQ/s320/1565607715_3931.jpg',
        'https://1.bp.blogspot.com/-dHeFkXljcKw/XryZPnjmjmI/AAAAAAAAGpU/tR-HySF57lkcf1hTbfhSWpABXrKQPD0yQCLcBGAsYHQ/s320/GUEST_fa339f39-08f8-4412-bbe6-3c091748f717.jpg',],
      description:'Due to increased demand, we temporarily have reduced product selection available for delivery to your region. We are working to improve selection availability as soon as possible.',
      colors: [
        Colors.brown,
        Colors.black,
        Colors.yellow,
        Colors.blueGrey,
        Colors.orange,
        Colors.green
      ],
      size: 'H:100cm W:300cm',
      favourite: 1,
      link:'https://codecanyon.net/item/flutter-ecommerce-ui/26541471',

    ),
    Article(
      quatity: 0,
      title:'MULTI GAME WOODEN COFFEE TABLE',
      label:'Tables',
      price:155.02,
      brand:'Multi',
      image:['https://1.bp.blogspot.com/-PNqrrv7mZT8/XryjsULA9EI/AAAAAAAAGrM/1NIiOGjL0uMguXHjDOTRyHHtk50wfUFbwCPcBGAYYCw/s320/0001309_multi-games-table-macassar-ebony-1.jpeg',
        'https://1.bp.blogspot.com/-6s4uTR7W05Y/XryZZ5ebjTI/AAAAAAAAGpY/-4rJoJ6tEo459NIp2Na3B0jI8im_nda8ACLcBGAsYHQ/s320/1565607715_3931.jpg',
        'https://1.bp.blogspot.com/-dHeFkXljcKw/XryZPnjmjmI/AAAAAAAAGpU/tR-HySF57lkcf1hTbfhSWpABXrKQPD0yQCLcBGAsYHQ/s320/GUEST_fa339f39-08f8-4412-bbe6-3c091748f717.jpg',],
      description:'Due to increased demand, we temporarily have reduced product selection available for delivery to your region. We are working to improve selection availability as soon as possible.',
      colors: [
        Colors.brown,
        Colors.black,
        Colors.yellow,
        Colors.blueGrey,
        Colors.orange,
        Colors.green
      ],
      size: 'H:100cm W:300cm',
      favourite: 1,
      link:'https://codecanyon.net/item/flutter-ecommerce-ui/26541471',

    ),
    Article(
      quatity: 0,
      title:'Pattern Area Rugs Thick Villus Doormat Plush Carpet Non-Slip Water Absorption Floor Door Mats Living Room',
      label:'Carpets',
      price:255.02,
      brand:'Armat',
      image:['https://1.bp.blogspot.com/-fXIG7yVIiD4/Xry0t1EgmGI/AAAAAAAAGrw/QGwqL499XpcML-zHXAPtwAo4spBU3gTCACLcBGAsYHQ/s320/510NOdxuU6L.jpg',
        'https://1.bp.blogspot.com/-6s4uTR7W05Y/XryZZ5ebjTI/AAAAAAAAGpY/-4rJoJ6tEo459NIp2Na3B0jI8im_nda8ACLcBGAsYHQ/s320/1565607715_3931.jpg',
        'https://1.bp.blogspot.com/-dHeFkXljcKw/XryZPnjmjmI/AAAAAAAAGpU/tR-HySF57lkcf1hTbfhSWpABXrKQPD0yQCLcBGAsYHQ/s320/GUEST_fa339f39-08f8-4412-bbe6-3c091748f717.jpg',],
      description:'Due to increased demand, we temporarily have reduced product selection available for delivery to your region. We are working to improve selection availability as soon as possible.',
      colors: [
        Colors.brown,
        Colors.black,
        Colors.yellow,
        Colors.blueGrey,
        Colors.orange,
        Colors.green
      ],
      size: 'H:100cm W:300cm',
      favourite: 0,
      link:'https://codecanyon.net/item/flutter-ecommerce-ui/26541471',

    ),

  ];


  static List<Article> articles = [
    Article(
      quatity: 0,
      title:'Table NARDI Rodi Tartoura',
      label:'Tables',
      price:55.99,
      brand:'Mades Tartoura',
      image:[
        'https://1.bp.blogspot.com/-dHeFkXljcKw/XryZPnjmjmI/AAAAAAAAGpU/tR-HySF57lkcf1hTbfhSWpABXrKQPD0yQCLcBGAsYHQ/s320/GUEST_fa339f39-08f8-4412-bbe6-3c091748f717.jpg',
        'https://1.bp.blogspot.com/-6s4uTR7W05Y/XryZZ5ebjTI/AAAAAAAAGpY/-4rJoJ6tEo459NIp2Na3B0jI8im_nda8ACLcBGAsYHQ/s320/1565607715_3931.jpg',
        'https://1.bp.blogspot.com/-94DTgKMQzy8/XryaNExcpVI/AAAAAAAAGpo/8CnBSs4oMKAt9lanH9SwRJS-tlBwIRhJACLcBGAsYHQ/s320/carpet.png'
      ],
      description:'Due to increased demand, we temporarily have reduced product selection available for delivery to your region. We are working to improve selection availability as soon as possible.',
      colors: [
        Colors.brown,
        Colors.yellow,
        Colors.blueGrey,
        Colors.black,
        Colors.orange,
        Colors.green
      ],
      size: 'H:100cm W:300cm',
      favourite: 0,
      link:'https://codecanyon.net/item/flutter-ecommerce-ui/26541471',



    ),
    Article(
      quatity: 0,
      title:'AmazonBasics Mesh, Mid-Back, Adjustable, Swivel Office Desk Chair',
      label:'Chairs',
      price:14.6,
      brand:'Amazon Fournitures',
      image:['https://1.bp.blogspot.com/-6s4uTR7W05Y/XryZZ5ebjTI/AAAAAAAAGpY/-4rJoJ6tEo459NIp2Na3B0jI8im_nda8ACLcBGAsYHQ/s320/1565607715_3931.jpg',
        'https://1.bp.blogspot.com/-dHeFkXljcKw/XryZPnjmjmI/AAAAAAAAGpU/tR-HySF57lkcf1hTbfhSWpABXrKQPD0yQCLcBGAsYHQ/s320/GUEST_fa339f39-08f8-4412-bbe6-3c091748f717.jpg',

      ],
      description:'Due to increased demand, we temporarily have reduced product selection available for delivery to your region. We are working to improve selection availability as soon as possible.',
      colors: [
        Colors.brown,
        Colors.yellow,
        Colors.blueGrey,
        Colors.black,
        Colors.orange,
        Colors.green
      ],
      size: 'H:100cm W:300cm',
      favourite: 1,
      link:'https://codecanyon.net/item/flutter-ecommerce-ui/26541471',



    ),
    Article(
      quatity: 0,
      title:'MANHATTAN VELVET',
      label:'Carpets',
      price:45.99,
      brand:'Smoke',
      image:['https://1.bp.blogspot.com/-94DTgKMQzy8/XryaNExcpVI/AAAAAAAAGpo/8CnBSs4oMKAt9lanH9SwRJS-tlBwIRhJACLcBGAsYHQ/s320/carpet.png',
        'https://1.bp.blogspot.com/-6s4uTR7W05Y/XryZZ5ebjTI/AAAAAAAAGpY/-4rJoJ6tEo459NIp2Na3B0jI8im_nda8ACLcBGAsYHQ/s320/1565607715_3931.jpg',
        'https://1.bp.blogspot.com/-dHeFkXljcKw/XryZPnjmjmI/AAAAAAAAGpU/tR-HySF57lkcf1hTbfhSWpABXrKQPD0yQCLcBGAsYHQ/s320/GUEST_fa339f39-08f8-4412-bbe6-3c091748f717.jpg',],
      description:'Due to increased demand, we temporarily have reduced product selection available for delivery to your region. We are working to improve selection availability as soon as possible.',
      colors: [
        Colors.brown,
        Colors.yellow,
        Colors.blueGrey,
        Colors.orange,
        Colors.black,
        Colors.green
      ],
      size: 'H:100cm W:300cm',
      favourite: 0,
      link:'https://codecanyon.net/item/flutter-ecommerce-ui/26541471',



    ),
    Article(
      quatity: 0,
      title:'Office Chair',
      label:'Chairs',
      price:55.99,
      brand:'Mades',
      image:['https://1.bp.blogspot.com/-u5F3L9qEwIQ/Xryc2_yPEBI/AAAAAAAAGp0/Tp1imyB6ScQk8nmcRJkmSpHoNFgSdZJ_gCLcBGAsYHQ/s320/crystal-revolving-chair.jpg',
        'https://1.bp.blogspot.com/-6s4uTR7W05Y/XryZZ5ebjTI/AAAAAAAAGpY/-4rJoJ6tEo459NIp2Na3B0jI8im_nda8ACLcBGAsYHQ/s320/1565607715_3931.jpg',
        'https://1.bp.blogspot.com/-dHeFkXljcKw/XryZPnjmjmI/AAAAAAAAGpU/tR-HySF57lkcf1hTbfhSWpABXrKQPD0yQCLcBGAsYHQ/s320/GUEST_fa339f39-08f8-4412-bbe6-3c091748f717.jpg',],
      description:'Due to increased demand, we temporarily have reduced product selection available for delivery to your region. We are working to improve selection availability as soon as possible.',
      colors: [
        Colors.brown,
        Colors.yellow,
        Colors.blueGrey,
        Colors.orange,
        Colors.black,
        Colors.green
      ],
      size: 'H:100cm W:300cm',
      favourite: 1,
      link:'https://codecanyon.net/item/flutter-ecommerce-ui/26541471',



    ),
    Article(
      quatity: 0,
      title:'Deluxe Matrix Medium Back Chair',
      label:'Chairs',
      price:95.99,
      brand:'Ergonomic',
      image:['https://1.bp.blogspot.com/-mW97R1-r_PY/XrydtwZ-MYI/AAAAAAAAGqA/us2Y818Th6QHBVpS7_xAvKh84B-mWivQACLcBGAsYHQ/s320/deluxe-matrix-medium-back-300x300.jpg',
        'https://1.bp.blogspot.com/-6s4uTR7W05Y/XryZZ5ebjTI/AAAAAAAAGpY/-4rJoJ6tEo459NIp2Na3B0jI8im_nda8ACLcBGAsYHQ/s320/1565607715_3931.jpg',
        'https://1.bp.blogspot.com/-dHeFkXljcKw/XryZPnjmjmI/AAAAAAAAGpU/tR-HySF57lkcf1hTbfhSWpABXrKQPD0yQCLcBGAsYHQ/s320/GUEST_fa339f39-08f8-4412-bbe6-3c091748f717.jpg',],
      description:'Due to increased demand, we temporarily have reduced product selection available for delivery to your region. We are working to improve selection availability as soon as possible.',
      colors: [
        Colors.brown,
        Colors.yellow,
        Colors.blueGrey,
        Colors.orange,
        Colors.black,
        Colors.green
      ],
      size: 'H:100cm W:300cm',
      favourite: 0,
      link:'https://codecanyon.net/item/flutter-ecommerce-ui/26541471',



    ),
    Article(
      quatity: 0,
      title:'Ergohuman Full Leather Chair',
      label:'Chairs',
      price:90.99,
      brand:'Amazon',
      image:['https://1.bp.blogspot.com/-PipmhmeP5jI/XryecT2jDdI/AAAAAAAAGqI/m92YxsOFv8M7TRb3PT0MA3bLFKIw-a7lgCLcBGAsYHQ/s320/ergohuman-full-leather-chair.jpg',
        'https://1.bp.blogspot.com/-6s4uTR7W05Y/XryZZ5ebjTI/AAAAAAAAGpY/-4rJoJ6tEo459NIp2Na3B0jI8im_nda8ACLcBGAsYHQ/s320/1565607715_3931.jpg',
        'https://1.bp.blogspot.com/-dHeFkXljcKw/XryZPnjmjmI/AAAAAAAAGpU/tR-HySF57lkcf1hTbfhSWpABXrKQPD0yQCLcBGAsYHQ/s320/GUEST_fa339f39-08f8-4412-bbe6-3c091748f717.jpg',],
      description:'Due to increased demand, we temporarily have reduced product selection available for delivery to your region. We are working to improve selection availability as soon as possible.',
      colors: [
        Colors.brown,
        Colors.black,
        Colors.yellow,
        Colors.blueGrey,
        Colors.orange,
        Colors.green
      ],
      size: 'H:100cm W:300cm',
      favourite: 1,
      link:'https://codecanyon.net/item/flutter-ecommerce-ui/26541471',



    ),
    Article(
      quatity: 0,
      title:'Matrix Executive Chair',
      label:'Chairs',
      price:60.99,
      brand:'Prime',
      image:['https://1.bp.blogspot.com/-psX-sctaU2I/XryfSdARL6I/AAAAAAAAGqU/VU7o2gB5flQ0pIg6LoQksoGUM4-TMqKHACLcBGAsYHQ/s320/matrix-hb-chair.jpg',
        'https://1.bp.blogspot.com/-6s4uTR7W05Y/XryZZ5ebjTI/AAAAAAAAGpY/-4rJoJ6tEo459NIp2Na3B0jI8im_nda8ACLcBGAsYHQ/s320/1565607715_3931.jpg',
        'https://1.bp.blogspot.com/-dHeFkXljcKw/XryZPnjmjmI/AAAAAAAAGpU/tR-HySF57lkcf1hTbfhSWpABXrKQPD0yQCLcBGAsYHQ/s320/GUEST_fa339f39-08f8-4412-bbe6-3c091748f717.jpg',],
      description:'Due to increased demand, we temporarily have reduced product selection available for delivery to your region. We are working to improve selection availability as soon as possible.',
      colors: [
        Colors.brown,
        Colors.black,
        Colors.yellow,
        Colors.blueGrey,
        Colors.orange,
        Colors.green
      ],
      size: 'H:100cm W:300cm',
      favourite: 1,
      link:'https://codecanyon.net/item/flutter-ecommerce-ui/26541471',



    ),
    Article(
      quatity: 0,
      title:'58" Dining Table',
      label:'Tables',
      price:55.90,
      brand:'Yukon',
      image:['https://1.bp.blogspot.com/-KpwELRV9G9U/Xrygio_bKRI/AAAAAAAAGqk/ozP1TgPG78kJztMMtwuFM5H14tG5Qp9CgCLcBGAsYHQ/s320/download.jpg',
        'https://1.bp.blogspot.com/-6s4uTR7W05Y/XryZZ5ebjTI/AAAAAAAAGpY/-4rJoJ6tEo459NIp2Na3B0jI8im_nda8ACLcBGAsYHQ/s320/1565607715_3931.jpg',
        'https://1.bp.blogspot.com/-dHeFkXljcKw/XryZPnjmjmI/AAAAAAAAGpU/tR-HySF57lkcf1hTbfhSWpABXrKQPD0yQCLcBGAsYHQ/s320/GUEST_fa339f39-08f8-4412-bbe6-3c091748f717.jpg',],
      description:'Due to increased demand, we temporarily have reduced product selection available for delivery to your region. We are working to improve selection availability as soon as possible.',
      colors: [
        Colors.brown,
        Colors.black,
        Colors.yellow,
        Colors.blueGrey,
        Colors.orange,
        Colors.green
      ],
      size: 'H:100cm W:300cm',
      favourite: 1,
      link:'https://codecanyon.net/item/flutter-ecommerce-ui/26541471',

    ),
    Article(
      quatity: 0,
      title:'Zinus Becky Farmhouse Wood Dining Table / Table Only',
      label:'Tables',
      price:505.90,
      brand:'Yukon',
      image:['https://1.bp.blogspot.com/-TJgP-tL9OcU/XryhN0a0QKI/AAAAAAAAGqs/kLkUmQyiIwkEzmw2HNwcG3hU3DiuCAiDACLcBGAsYHQ/s320/61QmwneQ-TL._AC_SL1500_.jpg',
        'https://1.bp.blogspot.com/-6s4uTR7W05Y/XryZZ5ebjTI/AAAAAAAAGpY/-4rJoJ6tEo459NIp2Na3B0jI8im_nda8ACLcBGAsYHQ/s320/1565607715_3931.jpg',
        'https://1.bp.blogspot.com/-dHeFkXljcKw/XryZPnjmjmI/AAAAAAAAGpU/tR-HySF57lkcf1hTbfhSWpABXrKQPD0yQCLcBGAsYHQ/s320/GUEST_fa339f39-08f8-4412-bbe6-3c091748f717.jpg',],
      description:'Due to increased demand, we temporarily have reduced product selection available for delivery to your region. We are working to improve selection availability as soon as possible.',
      colors: [
        Colors.brown,
        Colors.black,
        Colors.yellow,
        Colors.blueGrey,
        Colors.orange,
        Colors.green
      ],
      size: 'H:100cm W:300cm',
      favourite:0,
      link:'https://codecanyon.net/item/flutter-ecommerce-ui/26541471',

    ),
    Article(
      quatity: 0,
      title:'Jarvis Bamboo Adjustable-Height Conference Table',
      label:'Tables',
      price:505.90,
      brand:'NY',
      image:['https://1.bp.blogspot.com/-jvMSpG_Tw-c/XryhwzrxZBI/AAAAAAAAGq0/zWW5fLUQI4I9E9x26z1BL0tH1EhgR3KqwCLcBGAsYHQ/s320/fully-jarvis-bamboo-adjustable-height-conference-table_c_v1.jpg',
        'https://1.bp.blogspot.com/-6s4uTR7W05Y/XryZZ5ebjTI/AAAAAAAAGpY/-4rJoJ6tEo459NIp2Na3B0jI8im_nda8ACLcBGAsYHQ/s320/1565607715_3931.jpg',
        'https://1.bp.blogspot.com/-dHeFkXljcKw/XryZPnjmjmI/AAAAAAAAGpU/tR-HySF57lkcf1hTbfhSWpABXrKQPD0yQCLcBGAsYHQ/s320/GUEST_fa339f39-08f8-4412-bbe6-3c091748f717.jpg',],
      description:'Due to increased demand, we temporarily have reduced product selection available for delivery to your region. We are working to improve selection availability as soon as possible.',
      colors: [
        Colors.brown,
        Colors.black,
        Colors.yellow,
        Colors.blueGrey,
        Colors.orange,
        Colors.green
      ],
      size: 'H:100cm W:300cm',
      favourite: 1,
      link:'https://codecanyon.net/item/flutter-ecommerce-ui/26541471',

    ),
    Article(
      quatity: 0,
      title:'Roundhouse Coffee Table',
      label:'Tables',
      price:125.90,
      brand:'NY',
      image:['https://1.bp.blogspot.com/-aq0PfqWIl8c/XryicT5YmZI/AAAAAAAAGq8/3V_3pP-HDhgKumRr_Z1JvWQMFWJCcncCACLcBGAsYHQ/s320/rh1_coftbl_bk_front-roundhouse-coffee-table-black.jpg',
        'https://1.bp.blogspot.com/-6s4uTR7W05Y/XryZZ5ebjTI/AAAAAAAAGpY/-4rJoJ6tEo459NIp2Na3B0jI8im_nda8ACLcBGAsYHQ/s320/1565607715_3931.jpg',
        'https://1.bp.blogspot.com/-dHeFkXljcKw/XryZPnjmjmI/AAAAAAAAGpU/tR-HySF57lkcf1hTbfhSWpABXrKQPD0yQCLcBGAsYHQ/s320/GUEST_fa339f39-08f8-4412-bbe6-3c091748f717.jpg',],
      description:'Due to increased demand, we temporarily have reduced product selection available for delivery to your region. We are working to improve selection availability as soon as possible.',
      colors: [
        Colors.brown,
        Colors.black,
        Colors.yellow,
        Colors.blueGrey,
        Colors.orange,
        Colors.green
      ],
      size: 'H:100cm W:300cm',
      favourite: 0,
      link:'https://codecanyon.net/item/flutter-ecommerce-ui/26541471',

    ),
    Article(
      quatity: 0,
      title:'Coco Dining Table',
      label:'Tables',
      price:155.02,
      brand:'Life Interiors',
      image:['https://1.bp.blogspot.com/-vljndkENB8I/XryjDKKKbRI/AAAAAAAAGrE/UV6H9Ynz7i4BLBwtRGykk_HtKaOnaT2hQCLcBGAsYHQ/s320/dt-hal-coco-ash-70cm_1.jpg',
        'https://1.bp.blogspot.com/-6s4uTR7W05Y/XryZZ5ebjTI/AAAAAAAAGpY/-4rJoJ6tEo459NIp2Na3B0jI8im_nda8ACLcBGAsYHQ/s320/1565607715_3931.jpg',
        'https://1.bp.blogspot.com/-dHeFkXljcKw/XryZPnjmjmI/AAAAAAAAGpU/tR-HySF57lkcf1hTbfhSWpABXrKQPD0yQCLcBGAsYHQ/s320/GUEST_fa339f39-08f8-4412-bbe6-3c091748f717.jpg',],
      description:'Due to increased demand, we temporarily have reduced product selection available for delivery to your region. We are working to improve selection availability as soon as possible.',
      colors: [
        Colors.brown,
        Colors.black,
        Colors.yellow,
        Colors.blueGrey,
        Colors.orange,
        Colors.green
      ],
      size: 'H:100cm W:300cm',
      favourite: 1,
      link:'https://codecanyon.net/item/flutter-ecommerce-ui/26541471',

    ),
    Article(
      quatity: 0,
      title:'MULTI GAME WOODEN COFFEE TABLE',
      label:'Tables',
      price:155.02,
      brand:'Multi',
      image:['https://1.bp.blogspot.com/-PNqrrv7mZT8/XryjsULA9EI/AAAAAAAAGrM/1NIiOGjL0uMguXHjDOTRyHHtk50wfUFbwCPcBGAYYCw/s320/0001309_multi-games-table-macassar-ebony-1.jpeg',
        'https://1.bp.blogspot.com/-6s4uTR7W05Y/XryZZ5ebjTI/AAAAAAAAGpY/-4rJoJ6tEo459NIp2Na3B0jI8im_nda8ACLcBGAsYHQ/s320/1565607715_3931.jpg',
        'https://1.bp.blogspot.com/-dHeFkXljcKw/XryZPnjmjmI/AAAAAAAAGpU/tR-HySF57lkcf1hTbfhSWpABXrKQPD0yQCLcBGAsYHQ/s320/GUEST_fa339f39-08f8-4412-bbe6-3c091748f717.jpg',],
      description:'Due to increased demand, we temporarily have reduced product selection available for delivery to your region. We are working to improve selection availability as soon as possible.',
      colors: [
        Colors.brown,
        Colors.black,
        Colors.yellow,
        Colors.blueGrey,
        Colors.orange,
        Colors.green
      ],
      size: 'H:100cm W:300cm',
      favourite: 1,
      link:'https://codecanyon.net/item/flutter-ecommerce-ui/26541471',

    ),
    Article(
      quatity: 0,
      title:'MULTI GAME WOODEN COFFEE TABLE',
      label:'Tables',
      price:155.02,
      brand:'Multi',
      image:['https://1.bp.blogspot.com/-PNqrrv7mZT8/XryjsULA9EI/AAAAAAAAGrM/1NIiOGjL0uMguXHjDOTRyHHtk50wfUFbwCPcBGAYYCw/s320/0001309_multi-games-table-macassar-ebony-1.jpeg',
        'https://1.bp.blogspot.com/-6s4uTR7W05Y/XryZZ5ebjTI/AAAAAAAAGpY/-4rJoJ6tEo459NIp2Na3B0jI8im_nda8ACLcBGAsYHQ/s320/1565607715_3931.jpg',
        'https://1.bp.blogspot.com/-dHeFkXljcKw/XryZPnjmjmI/AAAAAAAAGpU/tR-HySF57lkcf1hTbfhSWpABXrKQPD0yQCLcBGAsYHQ/s320/GUEST_fa339f39-08f8-4412-bbe6-3c091748f717.jpg',],
      description:'Due to increased demand, we temporarily have reduced product selection available for delivery to your region. We are working to improve selection availability as soon as possible.',
      colors: [
        Colors.brown,
        Colors.black,
        Colors.yellow,
        Colors.blueGrey,
        Colors.orange,
        Colors.green
      ],
      size: 'H:100cm W:300cm',
      favourite: 0,
      link:'https://codecanyon.net/item/flutter-ecommerce-ui/26541471',

    ),
    Article(
      quatity: 0,
      title:'Shaw Sepia Carpet Tile',
      label:'Carpets',
      price:155.02,
      brand:'Carp',
      image:['https://1.bp.blogspot.com/-LnOOP3LGlec/Xryyj4RmXAI/AAAAAAAAGrY/d3YMshnJQU4A_sNY--_c5bjo5_vXAqhqACLcBGAsYHQ/s320/81d8Hnvy94L._SX466_.jpg',
        'https://1.bp.blogspot.com/-6s4uTR7W05Y/XryZZ5ebjTI/AAAAAAAAGpY/-4rJoJ6tEo459NIp2Na3B0jI8im_nda8ACLcBGAsYHQ/s320/1565607715_3931.jpg',
        'https://1.bp.blogspot.com/-dHeFkXljcKw/XryZPnjmjmI/AAAAAAAAGpU/tR-HySF57lkcf1hTbfhSWpABXrKQPD0yQCLcBGAsYHQ/s320/GUEST_fa339f39-08f8-4412-bbe6-3c091748f717.jpg',],
      description:'Due to increased demand, we temporarily have reduced product selection available for delivery to your region. We are working to improve selection availability as soon as possible.',
      colors: [
        Colors.brown,
        Colors.black,
        Colors.yellow,
        Colors.blueGrey,
        Colors.orange,
        Colors.green
      ],
      size: 'H:100cm W:300cm',
      favourite: 1,
      link:'https://codecanyon.net/item/flutter-ecommerce-ui/26541471',

    ),
    Article(
      quatity: 0,
      title:'Practical High-quality Home Carpet',
      label:'Carpets',
      price:255.02,
      brand:'Armat',
      image:['https://1.bp.blogspot.com/-NSUazw0-FCg/XryztvoF0BI/AAAAAAAAGrk/6gDVCXAguEwPRA7VmLq7qDoS0OrJd9HqgCLcBGAsYHQ/s320/b45e0233f37b14add13b8e7a937bba57.jpg',
        'https://1.bp.blogspot.com/-6s4uTR7W05Y/XryZZ5ebjTI/AAAAAAAAGpY/-4rJoJ6tEo459NIp2Na3B0jI8im_nda8ACLcBGAsYHQ/s320/1565607715_3931.jpg',
        'https://1.bp.blogspot.com/-dHeFkXljcKw/XryZPnjmjmI/AAAAAAAAGpU/tR-HySF57lkcf1hTbfhSWpABXrKQPD0yQCLcBGAsYHQ/s320/GUEST_fa339f39-08f8-4412-bbe6-3c091748f717.jpg',],
      description:'Due to increased demand, we temporarily have reduced product selection available for delivery to your region. We are working to improve selection availability as soon as possible.',
      colors: [
        Colors.brown,
        Colors.black,
        Colors.yellow,
        Colors.blueGrey,
        Colors.orange,
        Colors.green
      ],
      size: 'H:100cm W:300cm',
      favourite: 0,
      link:'https://codecanyon.net/item/flutter-ecommerce-ui/26541471',

    ),
    Article(
      quatity: 0,
      title:'Pattern Area Rugs Thick Villus Doormat Plush Carpet Non-Slip Water Absorption Floor Door Mats Living Room',
      label:'Carpets',
      price:255.02,
      brand:'Armat',
      image:['https://1.bp.blogspot.com/-fXIG7yVIiD4/Xry0t1EgmGI/AAAAAAAAGrw/QGwqL499XpcML-zHXAPtwAo4spBU3gTCACLcBGAsYHQ/s320/510NOdxuU6L.jpg',
        'https://1.bp.blogspot.com/-6s4uTR7W05Y/XryZZ5ebjTI/AAAAAAAAGpY/-4rJoJ6tEo459NIp2Na3B0jI8im_nda8ACLcBGAsYHQ/s320/1565607715_3931.jpg',
        'https://1.bp.blogspot.com/-dHeFkXljcKw/XryZPnjmjmI/AAAAAAAAGpU/tR-HySF57lkcf1hTbfhSWpABXrKQPD0yQCLcBGAsYHQ/s320/GUEST_fa339f39-08f8-4412-bbe6-3c091748f717.jpg',],
      description:'Due to increased demand, we temporarily have reduced product selection available for delivery to your region. We are working to improve selection availability as soon as possible.',
      colors: [
        Colors.brown,
        Colors.black,
        Colors.yellow,
        Colors.blueGrey,
        Colors.orange,
        Colors.green
      ],
      size: 'H:100cm W:300cm',
      favourite: 0,
      link:'https://codecanyon.net/item/flutter-ecommerce-ui/26541471',

    ),
  ];




}