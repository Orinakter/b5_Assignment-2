# Assignment-2

## 1. PostgreSQL কী?

PostgreSQL basically একটা ডেটাবেস সিস্টেম, যেটা দিয়ে আমরা ডেটা সংরক্ষণ বা ম্যানেজ করতে পারি। এটা open-source এবং অনেক বেশি ফিচার থাকে এর ভিতরে।
আমি এটা use করি কারণ এটা রিলায়েবল, বড় প্রজেক্টেও ভালোভাবে কাজ করে, আর JSON, ACID rules, ফাংশন, ইত্যাদি সাপোর্ট করে।
ধরো আমার ecommerce সাইটে products, users, orders — সবকিছুর ডেটা PostgreSQL এ রাখলে খুব ভালোভাবে handle করা যায়।

## 2. PostgreSQL এ Schema কেন দরকার হয়?

Schema basically একটা folder এর মতো — যেটার ভিতরে অনেকগুলো টেবিল, ফাংশন, ভিউ রাখা যায়। এটা ডেটাবেসকে ক্লিন ও আলাদা করে রাখে।
ধরো, আমি একটা বড় ডেটাবেজ করছি, যেখানে sales ও admin আলাদা আলাদা পার্ট। এখন আমি চাই sales এর টেবিলগুলো এক জায়গায় থাকুক, আর admin এরগুলো আরেক জায়গায়। তখন আমি schema ইউজ করে এটা খুব সুন্দরভাবে আলাদা রাখতে পারি।
আর বড় প্রজেক্টে এটা অনেক কাজে লাগে।

## 3. Primary Key আর Foreign Key কী বুঝি?

Primary Key মানে কোনো টেবিলের এমন একটা কলাম যেটা ইউনিক ও নাল হয় না। যেমন, users টেবিলের id usually primary key হয়।
Foreign Key মানে একটা টেবিল অন্য টেবিলের primary key কে refer করে।
যেমন, orders টেবিলে যদি user_id থাকে, সেটা users.id এর সাথে কানেক্টেড — মানে একজন ইউজার কয়টা অর্ডার করছে সেটা বুঝতে foreign key লাগে।
এগুলো use না করলে টেবিলের মধ্যে relation বোঝা মুশকিল হয়।

## 4. VARCHAR আর CHAR এর পার্থক্য কী?

এই দুইটাতে আমরা string/text রাখি। কিন্তু

CHAR(n) মানে fixed length — মানে তুমি ৩ ক্যারেক্টার দিলেও যদি ১০ character define করো, তাহলে বাকি জায়গা স্পেস দিয়ে পূরণ করবে।

VARCHAR(n) মানে variable length — যতটুকু লিখো, ততটুকুই নিবে।
মানে VARCHAR space efficient, আর বেশি flexible, তাই আমি বেশিরভাগ সময় VARCHAR use করি।

## 5. SELECT এ WHERE clause কেন ব্যবহার করি?

WHERE clause দিয়ে আমি বলি যে কোন রো/ডেটা গুলো দরকার।
যেমন আমি যদি SELECT * FROM users WHERE age > 18; লিখি, তাহলে শুধু বড়দের ডেটা দেখাবে।
না হলে তো পুরা টেবিল আসবে — যেটা অনেক বড় হতে পারে। তাই আমরা WHERE দিয়ে condition দেই।