CREATE TABLE "Products" (
  "product_id" serial PRIMARY KEY,
  "product_name" varchar
);

CREATE TABLE "Purchase_page" (
  "purphase_page_id" serial PRIMARY KEY,
  "purchase_page_ref" varchar
);

CREATE TABLE "State" (
  "state_id" serial PRIMARY KEY,
  "state" varchar
);

CREATE TABLE "First_touch" (
  "first_touch_id" serial PRIMARY KEY,
  "first_touch" varchar
);

CREATE TABLE "Signup_channel_category" (
  "signup_channel_category_id" serial PRIMARY KEY,
  "signup_channel_category" varchar
);


CREATE TABLE "Signup_channel" (
  "signup_channel_id" serial PRIMARY KEY,
  "signup_channel" varchar,
  "signup_channel_category_id" int,
  FOREIGN KEY ("signup_channel_category_id") REFERENCES "Signup_channel_category" ("signup_channel_category_id")
);


CREATE TABLE "Plan" (
  "plan_id" serial PRIMARY KEY,
  "plan" varchar
);

CREATE Table "Campaign_detail" (
  "campaign_detail_id" serial PRIMARY KEY,
  "campaign_detail" varchar
);

CREATE TABLE "Campaign_category" (
  "campaign_category_id" serial PRIMARY KEY,
  "campaign_category" varchar
);

CREATE TABLE "Campaign_type" (
  "campaign_type_id" serial PRIMARY KEY,
  "campaign_type" varchar
);

CREATE TABLE "Campaign_map" (
  "campaign_category_id" int,
  "campaign_type_id" int,
  FOREIGN KEY ("campaign_category_id") REFERENCES "Campaign_category" ("campaign_category_id"),
  FOREIGN KEY ("campaign_type_id") REFERENCES "Campaign_type" ("campaign_type_id")
);

CREATE TABLE "Platform" (
  "platform_id" serial PRIMARY KEY,
  "platform" varchar
);

CREATE TABLE "Campaigns" (
  "campaign_id" varchar PRIMARY KEY,
  "cost" float,
  "impressions" int,
  "clicks" float,
  "days_run" int,
  "campaign_category_id" int,
  "campaign_detail_id" int,
  "platform_id" int,
  "num_signups" float,
  "signup_rate" float,
  "cost_per_signup" float,
  "click_through_rate" float,
  "cost_per_click" float,
  FOREIGN KEY ("campaign_category_id") REFERENCES "Campaign_category" ("campaign_category_id"),
  FOREIGN KEY ("campaign_detail_id") REFERENCES "Campaign_detail" ("campaign_detail_id"),
  FOREIGN KEY ("platform_id") REFERENCES "Platform" ("platform_id")
);

CREATE TABLE "Customers" (
  "customer_id" varchar PRIMARY KEY,
  "first_name" varchar,
  "last_name" varchar,
  "signup_date" date,
  "campaign_id" varchar,
  "state_id" int,
  "first_touch_id" int,
  "plan_id" int,
  "signup_channel_id" int,
  FOREIGN KEY ("state_id") REFERENCES "State" ("state_id"),
  FOREIGN KEY ("first_touch_id") REFERENCES "First_touch" ("first_touch_id"),
  FOREIGN KEY ("plan_id") REFERENCES "Plan" ("plan_id"),
  FOREIGN KEY ("signup_channel_id") REFERENCES "Signup_channel" ("signup_channel_id"),
  FOREIGN KEY ("campaign_id") REFERENCES "Campaigns" ("campaign_id")
);

CREATE TABLE "Claims" (
  "claim_id" varchar PRIMARY KEY,
  "claim_date" date,
  "claim_amount" float,
  "covered_amount" float,
  "product_id" int,
  "purchase_page_id" int,
  "customer_id" varchar,
  FOREIGN KEY ("product_id") REFERENCES "Products" ("product_id"),
  FOREIGN KEY ("purchase_page_id") REFERENCES "Purchase_page" ("purphase_page_id"),
  FOREIGN KEY ("customer_id") REFERENCES "Customers" ("customer_id")
);
