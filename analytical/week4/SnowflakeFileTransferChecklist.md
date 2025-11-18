# Snowflake File Transfer
Got it 👍 — here’s a **clean, checklist-only version** for transferring a file from your **local system into Snowflake using a User Specific Stage (`@~`)**:

---

# ✅ Checklist: Load Local File → Snowflake via User Stage (`@~`)


### **A. Stage the File**

* [ ] Clean up user stage (optional):

  ```sql
  RM @~;
  LIST @~;
  ```
* [ ] Upload file from local system to user stage:

  ```bash
  snowsql -c wcd -q "PUT file://city.csv @~;"
  ```
* [ ] Confirm file in stage:

  ```sql
  LIST @~;
  ```

---

### **B. Load into Table**

* [ ] Copy staged file into table:

  ```sql
  COPY INTO walmart_dev.enterprise.city
  FROM @~/city.csv;
  ```
* [ ] Verify data loaded:

  ```sql
  SELECT * FROM walmart_dev.enterprise.city;
  ```

---
## ✅ Method 2 — S3 → Snowflake via Named Stage

### **A. AWS Setup**

* [ ] Create S3 bucket: `snowflake-stage-bucket-<your name>`.
* [ ] Create new IAM Role → Entity type = AWS Account → Another AWS account (dummy ID for now).
* [ ] Enter **External ID = 0000** (temporary, will replace later).
* [ ] Create custom policy with bucket ARN:

  * `"Resource": "<bucket-arn>/*"` (object-level).
  * `"Resource": "<bucket-arn>"` (bucket-level).
* [ ] Name policy: `snowflake-stage-bucket-policy`.
* [ ] Attach policy to IAM role.
* [ ] Name IAM role: `snowflake-stage-bucket-role`.

---

### **B. Snowflake Integration**

* [ ] Create storage integration:

  ```sql
  CREATE OR REPLACE STORAGE INTEGRATION S3_INT_WCD_LECT1
    TYPE = EXTERNAL_STAGE
    STORAGE_PROVIDER = S3
    ENABLED = TRUE
    STORAGE_AWS_ROLE_ARN = '<IAM role ARN>'
    STORAGE_ALLOWED_LOCATIONS = ('s3://snowflake-stage-bucket-<your name>');
  ```
* [ ] Run `DESC INTEGRATION S3_INT_WCD_LECT1;` and note:

  * `STORAGE_AWS_IAM_USER_ARN`
  * `STORAGE_AWS_EXTERNAL_ID`

---

### **C. Update AWS Role Trust Relationship**

* [ ] Edit IAM Role → Trust relationships → Replace JSON with:

  ```json
  {
      "Version": "2012-10-17",
      "Statement": [
          {
              "Effect": "Allow",
              "Principal": {
                  "AWS": "<STORAGE_AWS_IAM_USER_ARN>"
              },
              "Action": "sts:AssumeRole",
              "Condition": {
                  "StringEquals": {
                      "sts:ExternalId": "<STORAGE_AWS_EXTERNAL_ID>"
                  }
              }
          }
      ]
  }
  ```

---

### **D. Snowflake File Format & Grants**

* [ ] Switch context:

  ```sql
  USE DATABASE walmart_dev;
  USE SCHEMA enterprise;
  ```
* [ ] Create file format:

  ```sql
  CREATE OR REPLACE FILE FORMAT CSV_COMMA
    TYPE = 'CSV'
    FIELD_DELIMITER = ',';
  ```
* [ ] Grant rights:

  ```sql
  GRANT CREATE STAGE ON SCHEMA enterprise TO ROLE accountadmin;
  GRANT USAGE ON INTEGRATION S3_INT_WCD_LECT1 TO ROLE accountadmin;
  ```

---

### **E. Create Named Stage**

* [ ] Create stage:

  ```sql
  CREATE OR REPLACE STAGE walmart.enterprise.WCD_LECT1_STAGE
    STORAGE_INTEGRATION = S3_INT_WCD_LECT1
    URL = 's3://snowflake-stage-bucket-<your name>'
    FILE_FORMAT = CSV_COMMA;
  ```
* [ ] Verify stage exists:

  ```sql
  SHOW STAGES;
  ```

---

### **F. Test Data Flow**

* [ ] Upload test `.csv` file to S3 bucket.
* [ ] Check stage contents:

  ```sql
  LIST @walmart.enterprise.WCD_LECT1_STAGE;
  ```
* [ ] Copy data into table:

  ```sql
  COPY INTO walmart.enterprise.city
    FROM @walmart.enterprise.WCD_LECT1_STAGE/city.csv
    FILE_FORMAT = CSV_COMMA;
  ```
* [ ] Query target table to confirm data loaded.

---
