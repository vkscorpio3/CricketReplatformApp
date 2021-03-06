CREATE TABLE CKT_ZIPCODE_INFO (
  ID VARCHAR2(40 BYTE), 
  ZIP_CODE VARCHAR2(40 BYTE),
  CITY VARCHAR2(254 BYTE),
  STATE VARCHAR2(254 BYTE),
  COUNTRY VARCHAR2(254 BYTE),
  CITY_TYPE VARCHAR2(254 BYTE), 
  AREA_CODE VARCHAR2(254 BYTE),
  LATITUDE VARCHAR2(254 BYTE),
  LONGITUDE VARCHAR2(254 BYTE),
  CLASSIFICATION_CODE VARCHAR2(254 BYTE),
  TIME_ZONE VARCHAR2(254 BYTE)
);

ALTER TABLE CKT_ZIPCODE_INFO ADD CONSTRAINT CKT_ZIPCODE_INFO_P  PRIMARY KEY (ID);

ALTER TABLE CKT_ZIPCODE_INFO ADD City_Alias_Mixed_Case varchar(35) NULL;

COMMIT;
