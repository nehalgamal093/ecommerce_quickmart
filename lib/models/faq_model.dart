class FAQModel{
   String question;
   String answer;
  FAQModel({required this.question,required this.answer});
}
List<FAQModel> faqList = [
  FAQModel(question: 'Can I cancel my order?', answer: 'Yes only if the order is not dispatched yet. You can contact our customer service department to get your order canceled.'),
  FAQModel(question: 'Will I receive the same product I see in the photo?', answer: 'Actual product color may vary from the images shown. Every monitor or mobile display has a different capability to display colors, and every individual may see these colors differently. In addition, lighting conditions at the time the photo was taken can also affect an image\'s color.'),
  FAQModel(question: 'How can I recover the forgotten password?', answer: 'If you have forgotten your password, you can recover it from "Login - Forgotten your password?" section. You will receive an e-mail with a link to enter and confirm your new password.'),
  FAQModel(question: 'Is my personal information confidential?', answer: 'Your personal information is confidential. We do not rent, sell, barter or trade email addresses. When you place an order with us, we collect your name, address, telephone number, credit card information and your email address. We use this information to fulfill your order and to communicate with you about your order. All your information is kept confidential and will not be disclosed to anybody unless ordered by government authorities.'),
  FAQModel(question: 'What payment methods can I use to make purchases?', answer: 'We offer the following payment methods: PayPal, VISA, MasterCard and Voucher code, if applicable.'),
];