CREATE OR REPLACE PACKAGE BODY xxws.xxws_arac_degerlendirme_pkg
IS
   PROCEDURE insert_data (p_arac_no         IN xxws_arac_degerlendirme.arac_no%TYPE,
                          p_user_id         IN xxws_arac_degerlendirme.user_id%TYPE,
                          p_kisi_no         IN xxws_arac_degerlendirme.kisi_no%TYPE,
                          p_guvenlik_sw     IN xxws_arac_degerlendirme.guvenlik_sw%TYPE,
                          p_performans_sw   IN xxws_arac_degerlendirme.performans_sw%TYPE,
                          p_konfor_sw       IN xxws_arac_degerlendirme.konfor_sw%TYPE,
                          p_teknoloji_sw    IN xxws_arac_degerlendirme.teknoloji_sw%TYPE,
                          p_dayaniklilik_sw IN xxws_arac_degerlendirme.dayaniklilik_sw%TYPE,
                          p_ic_tasarim_sw   IN xxws_arac_degerlendirme.ic_tasarim_sw%TYPE,
                          p_dis_tasarim_sw  IN xxws_arac_degerlendirme.dis_tasarim_sw%TYPE,
                          p_ekonomi_sw      IN xxws_arac_degerlendirme.ekonomi_sw%TYPE,
                          p_memnuniyet_sw   IN xxws_arac_degerlendirme.memnuniyet_sw%TYPE,
                          p_aciklama        IN xxws_arac_degerlendirme.aciklama%TYPE,
                          p_result          OUT xxws_generic_pkg.result_code%TYPE)
   IS
    d_sqlrowcount  NUMBER;
   BEGIN
      INSERT INTO xxws_arac_degerlendirme(no, arac_no, kisi_no, user_id, guvenlik_sw, performans_sw, konfor_sw, teknoloji_sw, dayaniklilik_sw, ic_tasarim_sw,
                  dis_tasarim_sw, ekonomi_sw, memnuniyet_sw, aciklama, creation_date)
          VALUES (xxws_arac_degerlendirme_s.NEXTVAL, p_arac_no, p_kisi_no, p_user_id, p_guvenlik_sw, p_performans_sw, p_konfor_sw, p_teknoloji_sw, p_dayaniklilik_sw, p_ic_tasarim_sw,
                  p_dis_tasarim_sw, p_ekonomi_sw, p_memnuniyet_sw, p_aciklama, SYSDATE);

      d_sqlrowcount := SQL%ROWCOUNT;

      IF d_sqlrowcount = 1 THEN
         p_result := xxws_generic_pkg.result_code_successful;
      ELSE
         p_result := xxws_generic_pkg.result_code_warning;
      END IF;
   EXCEPTION
         WHEN OTHERS THEN
            ROLLBACK;
            p_result := xxws_generic_pkg.result_code_fail;
   END insert_data;
END xxws_arac_degerlendirme_pkg;
/