CREATE OR REPLACE PACKAGE BODY xxws.xxws_generic_pkg
IS
   FUNCTION f_bosluk_temizle(p_metin IN VARCHAR2)
      RETURN VARCHAR2
   IS
   BEGIN
      RETURN REPLACE(REPLACE(REPLACE(p_metin, ' '), '-'), '.');
   END f_bosluk_temizle;

   -----------------------------------------------------------------------------

   FUNCTION f_turkce_karakter_duzelt(p_metin IN VARCHAR2)
      RETURN VARCHAR2
   IS
   BEGIN
      RETURN TRANSLATE(UPPER(p_metin), 'ÇĞİÖŞÜ', 'CGIOSU');
   END f_turkce_karakter_duzelt;

   -----------------------------------------------------------------------------

   FUNCTION f_url(p_metin IN VARCHAR2)
      RETURN VARCHAR2
   IS
   BEGIN
      RETURN REPLACE(LOWER(TRANSLATE(TRIM(p_metin), 'ÇĞİÖŞÜçğıöşü', 'CGIOSUcgiosu')), ' ', '-');
   END f_url;

   -----------------------------------------------------------------------------

   FUNCTION f_tarihi_formatla(p_tarih_chr IN portal_tarih_formati%TYPE)
      RETURN DATE
   IS
   BEGIN
      RETURN TO_DATE(TRIM(p_tarih_chr), 'DD.MM.YYYY');
   END f_tarihi_formatla;
END xxws_generic_pkg;
/