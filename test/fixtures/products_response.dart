Map<String, dynamic> productJsonFixture() => {
      "id": "1",
      "title": "Test Product",
      "slug": "test-product",
      "price": 100,
      "priceAfterDiscount": 90,
      "ratingAvg": 4.5,
      "ratingCount": 10,
      "description": "A test product",
      "quantity": 50,
      "sold": 5,
      "images": [
        {"attachmentFile": "image_url_1"}
      ],
      "category": "Electronics",
      "subCategory": "Phones",
      "brand": "TestBrand",
      "createdAt": "2025-01-01T00:00:00Z",
      "updatedAt": "2025-01-02T00:00:00Z",
      "v": 1,
      "myReviews": ["Nice", "Good"],
    };

Map<String, dynamic> productInforJsonFixture() => {
      "message": "success",
      "result": {
        "_id": "67d75ac5d7c6ee4f73f543ba",
        "title": "HP Envy 16 Touch - 13th i7-13700H",
        "slug": "hp-envy-16-touch-13th-i7-13700h",
        "price": 8289900,
        "priceAfterDiscount": 8000000,
        "ratingAvg": 4,
        "ratingCount": 0,
        "description":
            "Special Design: You deserve to live in the Utmost Comfort",
        "quantity": 10,
        "sold": 4,
        "images": [
          {
            "attachment_file":
                "https://res.cloudinary.com/doomfqwge/image/upload/v1742166722/jembpx25fdcahsskb3vc.jpg",
            "cloudinary_id": "qrjaxdqmzdza6h1tfve9",
            "_id": "67d75ac5d7c6ee4f73f543bb",
            "id": "67d75ac5d7c6ee4f73f543bb"
          },
          {
            "attachment_file":
                "https://res.cloudinary.com/doomfqwge/image/upload/v1742166723/mqiivuivfjc1cfalu5eh.jpg",
            "cloudinary_id": "t8jnbqnzkia8d7exwvf2",
            "_id": "67d75ac5d7c6ee4f73f543bc",
            "id": "67d75ac5d7c6ee4f73f543bc"
          },
          {
            "attachment_file":
                "https://res.cloudinary.com/doomfqwge/image/upload/v1742166724/wu1tmrejyvoc48bgaypz.jpg",
            "cloudinary_id": "peuczi8alrvq32j3sq0o",
            "_id": "67d75ac5d7c6ee4f73f543bd",
            "id": "67d75ac5d7c6ee4f73f543bd"
          }
        ],
        "category": "67d7248604bcc6a34fc4de86",
        "subCategory": "67d7538f55679798bbbae04f",
        "brand": "65154e49e76b1683b590febc",
        "createdAt": "2025-03-16T23:12:05.551Z",
        "updatedAt": "2025-03-16T23:12:05.551Z",
        "__v": 0,
        "myReviews": [
          {
            "_id": "67dc957630b82aef2affbcde",
            "comment": "OK",
            "product": "67d75ac5d7c6ee4f73f543ba",
            "user": {"_id": "67dc953730b82aef2affbcd5", "name": "ahmed"},
            "ratings": 2,
            "createdAt": "2025-03-20T22:23:50.962Z",
            "updatedAt": "2025-03-20T22:23:50.962Z",
            "__v": 0
          },
          {
            "_id": "67dc959830b82aef2affbce4",
            "comment": "Nice",
            "product": "67d75ac5d7c6ee4f73f543ba",
            "user": {"_id": "67dc954e30b82aef2affbcd8", "name": "mohamed"},
            "ratings": 2,
            "createdAt": "2025-03-20T22:24:24.093Z",
            "updatedAt": "2025-03-20T22:24:24.093Z",
            "__v": 0
          },
          {
            "_id": "67df2d0629e672521dbc6227",
            "comment": "ok",
            "product": "67d75ac5d7c6ee4f73f543ba",
            "user": {"_id": "67d722b304bcc6a34fc4de7d", "name": "nehal"},
            "ratings": 3,
            "createdAt": "2025-03-22T21:35:02.611Z",
            "updatedAt": "2025-03-22T21:35:02.611Z",
            "__v": 0
          }
        ],
        "id": "67d75ac5d7c6ee4f73f543ba"
      }
    };

Map<String, dynamic> reviewsForJsonFixture() => {
      "message": "success",
      "page": 1,
      "result": [
        {
          "_id": "67dc957630b82aef2affbcde",
          "comment": "OK",
          "product": "67d75ac5d7c6ee4f73f543ba",
          "user": {"_id": "67dc953730b82aef2affbcd5", "name": "ahmed"},
          "ratings": 2,
          "createdAt": "2025-03-20T22:23:50.962Z",
          "updatedAt": "2025-03-20T22:23:50.962Z",
          "__v": 0
        },
        {
          "_id": "67dc959830b82aef2affbce4",
          "comment": "Nice",
          "product": "67d75ac5d7c6ee4f73f543ba",
          "user": {"_id": "67dc954e30b82aef2affbcd8", "name": "mohamed"},
          "ratings": 2,
          "createdAt": "2025-03-20T22:24:24.093Z",
          "updatedAt": "2025-03-20T22:24:24.093Z",
          "__v": 0
        },
        {
          "_id": "67df2d0629e672521dbc6227",
          "comment": "ok",
          "product": "67d75ac5d7c6ee4f73f543ba",
          "user": {"_id": "67d722b304bcc6a34fc4de7d", "name": "nehal"},
          "ratings": 3,
          "createdAt": "2025-03-22T21:35:02.611Z",
          "updatedAt": "2025-03-22T21:35:02.611Z",
          "__v": 0
        }
      ]
    };
Map<String, dynamic> reviewResponseforJsonFixture() => {
  "message": "success",
  "result": {
    "comment": "Nice",
    "product": "67d75ac5d7c6ee4f73f543ba",
    "user": "6901093cb7b5dacc8149483e",
    "ratings": 2,
    "_id": "69010964b7b5dacc81494844",
    "createdAt": "2025-10-28T18:20:20.092Z",
    "updatedAt": "2025-10-28T18:20:20.092Z",
    "__v": 0
  }
};
