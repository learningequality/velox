--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.8
-- Dumped by pg_dump version 9.6.8

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE ONLY public.morango_transfersession DROP CONSTRAINT morango_transfersess_sync_session_id_0455b5bd_fk_morango_s;
ALTER TABLE ONLY public.morango_syncsession DROP CONSTRAINT morango_syncsession_server_certificate_i_52bf728f_fk_morango_c;
ALTER TABLE ONLY public.morango_syncsession DROP CONSTRAINT morango_syncsession_client_certificate_i_507e0d5d_fk_morango_c;
ALTER TABLE ONLY public.morango_recordmaxcounterbuffer DROP CONSTRAINT morango_recordmaxcou_transfer_session_id_1e48e3dd_fk_morango_t;
ALTER TABLE ONLY public.morango_recordmaxcounter DROP CONSTRAINT morango_recordmaxcou_store_model_id_2a91327d_fk_morango_s;
ALTER TABLE ONLY public.morango_instanceidmodel DROP CONSTRAINT morango_instanceidmo_database_id_3d1b7c0a_fk_morango_d;
ALTER TABLE ONLY public.morango_certificate DROP CONSTRAINT morango_certificate_scope_definition_id_1f75587b_fk_morango_s;
ALTER TABLE ONLY public.morango_certificate DROP CONSTRAINT morango_certificate_parent_id_60dedc2b_fk_morango_c;
ALTER TABLE ONLY public.morango_buffer DROP CONSTRAINT morango_buffer_transfer_session_id_8e70af5a_fk_morango_t;
ALTER TABLE ONLY public.logger_usersessionlog DROP CONSTRAINT logger_usersessionlo_user_id_a755b0c2_fk_kolibriau;
ALTER TABLE ONLY public.logger_usersessionlog DROP CONSTRAINT logger_usersessionlo_dataset_id_1a2bbb5f_fk_kolibriau;
ALTER TABLE ONLY public.logger_masterylog DROP CONSTRAINT logger_masterylog_user_id_3f58a1cb_fk_kolibriau;
ALTER TABLE ONLY public.logger_masterylog DROP CONSTRAINT logger_masterylog_summarylog_id_f2816f59_fk_logger_co;
ALTER TABLE ONLY public.logger_masterylog DROP CONSTRAINT logger_masterylog_dataset_id_f5b54331_fk_kolibriau;
ALTER TABLE ONLY public.logger_examlog DROP CONSTRAINT logger_examlog_user_id_05397f8b_fk_kolibriauth_facilityuser_id;
ALTER TABLE ONLY public.logger_examlog DROP CONSTRAINT logger_examlog_exam_id_41856b8c_fk_exams_exam_id;
ALTER TABLE ONLY public.logger_examlog DROP CONSTRAINT logger_examlog_dataset_id_13109aa7_fk_kolibriau;
ALTER TABLE ONLY public.logger_examattemptlog DROP CONSTRAINT logger_examattemptlog_examlog_id_ad0f674d_fk_logger_examlog_id;
ALTER TABLE ONLY public.logger_examattemptlog DROP CONSTRAINT logger_examattemptlo_user_id_5442dc41_fk_kolibriau;
ALTER TABLE ONLY public.logger_examattemptlog DROP CONSTRAINT logger_examattemptlo_dataset_id_9f9d1b24_fk_kolibriau;
ALTER TABLE ONLY public.logger_contentsummarylog DROP CONSTRAINT logger_contentsummar_user_id_16aa2b2c_fk_kolibriau;
ALTER TABLE ONLY public.logger_contentsummarylog DROP CONSTRAINT logger_contentsummar_dataset_id_f9a1ad8e_fk_kolibriau;
ALTER TABLE ONLY public.logger_contentsessionlog DROP CONSTRAINT logger_contentsessio_user_id_173ee284_fk_kolibriau;
ALTER TABLE ONLY public.logger_contentsessionlog DROP CONSTRAINT logger_contentsessio_dataset_id_9b53cdba_fk_kolibriau;
ALTER TABLE ONLY public.logger_attemptlog DROP CONSTRAINT logger_attemptlog_user_id_cd57843f_fk_kolibriau;
ALTER TABLE ONLY public.logger_attemptlog DROP CONSTRAINT logger_attemptlog_sessionlog_id_0a239a1a_fk_logger_co;
ALTER TABLE ONLY public.logger_attemptlog DROP CONSTRAINT logger_attemptlog_masterylog_id_d65af27c_fk_logger_ma;
ALTER TABLE ONLY public.logger_attemptlog DROP CONSTRAINT logger_attemptlog_dataset_id_3017c88e_fk_kolibriau;
ALTER TABLE ONLY public.lessons_lessonassignment DROP CONSTRAINT lessons_lessonassign_lesson_id_52b19e73_fk_lessons_l;
ALTER TABLE ONLY public.lessons_lessonassignment DROP CONSTRAINT lessons_lessonassign_dataset_id_07c252d8_fk_kolibriau;
ALTER TABLE ONLY public.lessons_lessonassignment DROP CONSTRAINT lessons_lessonassign_collection_id_d30ca20a_fk_kolibriau;
ALTER TABLE ONLY public.lessons_lessonassignment DROP CONSTRAINT lessons_lessonassign_assigned_by_id_ed8b2358_fk_kolibriau;
ALTER TABLE ONLY public.lessons_lesson DROP CONSTRAINT lessons_lesson_dataset_id_da71bead_fk_kolibriau;
ALTER TABLE ONLY public.lessons_lesson DROP CONSTRAINT lessons_lesson_created_by_id_441dbacf_fk_kolibriau;
ALTER TABLE ONLY public.lessons_lesson DROP CONSTRAINT lessons_lesson_collection_id_13b7d040_fk_kolibriau;
ALTER TABLE ONLY public.kolibriauth_role DROP CONSTRAINT kolibriauth_role_user_id_d4014967_fk_kolibriau;
ALTER TABLE ONLY public.kolibriauth_role DROP CONSTRAINT kolibriauth_role_dataset_id_70eb0469_fk_kolibriau;
ALTER TABLE ONLY public.kolibriauth_role DROP CONSTRAINT kolibriauth_role_collection_id_1fa9ce6f_fk_kolibriau;
ALTER TABLE ONLY public.kolibriauth_membership DROP CONSTRAINT kolibriauth_membersh_user_id_79317fa1_fk_kolibriau;
ALTER TABLE ONLY public.kolibriauth_membership DROP CONSTRAINT kolibriauth_membersh_dataset_id_13e29803_fk_kolibriau;
ALTER TABLE ONLY public.kolibriauth_membership DROP CONSTRAINT kolibriauth_membersh_collection_id_c955dbd2_fk_kolibriau;
ALTER TABLE ONLY public.kolibriauth_facilityuser DROP CONSTRAINT kolibriauth_facility_facility_id_f602d621_fk_kolibriau;
ALTER TABLE ONLY public.kolibriauth_facilityuser DROP CONSTRAINT kolibriauth_facility_dataset_id_0dab63f9_fk_kolibriau;
ALTER TABLE ONLY public.kolibriauth_collection DROP CONSTRAINT kolibriauth_collecti_parent_id_1561ec4a_fk_kolibriau;
ALTER TABLE ONLY public.kolibriauth_collection DROP CONSTRAINT kolibriauth_collecti_dataset_id_5689c7d8_fk_kolibriau;
ALTER TABLE ONLY public.exams_examassignment DROP CONSTRAINT exams_examassignment_exam_id_d7c499da_fk_exams_exam_id;
ALTER TABLE ONLY public.exams_examassignment DROP CONSTRAINT exams_examassignment_dataset_id_3200aa09_fk_kolibriau;
ALTER TABLE ONLY public.exams_examassignment DROP CONSTRAINT exams_examassignment_collection_id_90ec6a7a_fk_kolibriau;
ALTER TABLE ONLY public.exams_examassignment DROP CONSTRAINT exams_examassignment_assigned_by_id_53aa193a_fk_kolibriau;
ALTER TABLE ONLY public.exams_exam DROP CONSTRAINT exams_exam_dataset_id_7dff1bad_fk_kolibriau;
ALTER TABLE ONLY public.exams_exam DROP CONSTRAINT exams_exam_creator_id_37d1b2e5_fk_kolibriauth_facilityuser_id;
ALTER TABLE ONLY public.exams_exam DROP CONSTRAINT exams_exam_collection_id_9dc0b187_fk_kolibriauth_collection_id;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_kolibriau;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
ALTER TABLE ONLY public.device_devicesettings DROP CONSTRAINT device_devicesetting_default_facility_id_8937e0b7_fk_kolibriau;
ALTER TABLE ONLY public.device_devicepermissions DROP CONSTRAINT device_devicepermiss_user_id_7bb0f5a7_fk_kolibriau;
ALTER TABLE ONLY public.content_file DROP CONSTRAINT content_file_local_file_id_9780c2ab_fk_content_localfile_id;
ALTER TABLE ONLY public.content_file DROP CONSTRAINT content_file_lang_id_364540cd_fk_content_language_id;
ALTER TABLE ONLY public.content_file DROP CONSTRAINT content_file_contentnode_id_d4089e6e_fk_content_contentnode_id;
ALTER TABLE ONLY public.content_contentnode DROP CONSTRAINT content_contentnode_parent_id_47178783_fk_content_c;
ALTER TABLE ONLY public.content_contentnode DROP CONSTRAINT content_contentnode_lang_id_600d594b_fk_content_language_id;
ALTER TABLE ONLY public.content_contentnode_has_prerequisite DROP CONSTRAINT content_contentnode__to_contentnode_id_5561f92c_fk_content_c;
ALTER TABLE ONLY public.content_contentnode_related DROP CONSTRAINT content_contentnode__to_contentnode_id_42e82421_fk_content_c;
ALTER TABLE ONLY public.content_contentnode_related DROP CONSTRAINT content_contentnode__from_contentnode_id_f56e3999_fk_content_c;
ALTER TABLE ONLY public.content_contentnode_has_prerequisite DROP CONSTRAINT content_contentnode__from_contentnode_id_1085c145_fk_content_c;
ALTER TABLE ONLY public.content_contentnode_tags DROP CONSTRAINT content_contentnode__contenttag_id_9518e093_fk_content_c;
ALTER TABLE ONLY public.content_contentnode_tags DROP CONSTRAINT content_contentnode__contentnode_id_4ea196dd_fk_content_c;
ALTER TABLE ONLY public.content_channelmetadata DROP CONSTRAINT content_channelmetad_root_id_ba963469_fk_content_c;
ALTER TABLE ONLY public.content_assessmentmetadata DROP CONSTRAINT content_assessmentme_contentnode_id_19cbc70a_fk_content_c;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
DROP INDEX public.morango_transfersession_sync_session_id_0455b5bd;
DROP INDEX public.morango_syncsession_server_certificate_id_52bf728f;
DROP INDEX public.morango_syncsession_client_certificate_id_507e0d5d;
DROP INDEX public.morango_scopedefinition_scope_id_827eada2_like;
DROP INDEX public.morango_recordmaxcounterbuffer_transfer_session_id_1e48e3dd;
DROP INDEX public.morango_recordmaxcounter_store_model_id_2a91327d;
DROP INDEX public.morango_instanceidmodel_database_id_3d1b7c0a;
DROP INDEX public.morango_certificate_tree_id_88a9f83c;
DROP INDEX public.morango_certificate_scope_definition_id_1f75587b_like;
DROP INDEX public.morango_certificate_scope_definition_id_1f75587b;
DROP INDEX public.morango_certificate_rght_fc1fe114;
DROP INDEX public.morango_certificate_parent_id_60dedc2b;
DROP INDEX public.morango_certificate_lft_7686107b;
DROP INDEX public.morango_certificate_level_bb83c8bf;
DROP INDEX public.morango_buffer_transfer_session_id_8e70af5a;
DROP INDEX public.logger_usersessionlog_user_id_a755b0c2;
DROP INDEX public.logger_usersessionlog_dataset_id_1a2bbb5f;
DROP INDEX public.logger_masterylog_user_id_3f58a1cb;
DROP INDEX public.logger_masterylog_summarylog_id_f2816f59;
DROP INDEX public.logger_masterylog_dataset_id_f5b54331;
DROP INDEX public.logger_examlog_user_id_05397f8b;
DROP INDEX public.logger_examlog_exam_id_41856b8c;
DROP INDEX public.logger_examlog_dataset_id_13109aa7;
DROP INDEX public.logger_examattemptlog_user_id_5442dc41;
DROP INDEX public.logger_examattemptlog_examlog_id_ad0f674d;
DROP INDEX public.logger_examattemptlog_dataset_id_9f9d1b24;
DROP INDEX public.logger_contentsummarylog_user_id_16aa2b2c;
DROP INDEX public.logger_contentsummarylog_dataset_id_f9a1ad8e;
DROP INDEX public.logger_contentsummarylog_content_id_2e21d8cf;
DROP INDEX public.logger_contentsessionlog_user_id_173ee284;
DROP INDEX public.logger_contentsessionlog_dataset_id_9b53cdba;
DROP INDEX public.logger_contentsessionlog_content_id_12ef7b71;
DROP INDEX public.logger_attemptlog_user_id_cd57843f;
DROP INDEX public.logger_attemptlog_sessionlog_id_0a239a1a;
DROP INDEX public.logger_attemptlog_masterylog_id_d65af27c;
DROP INDEX public.logger_attemptlog_dataset_id_3017c88e;
DROP INDEX public.lessons_lessonassignment_lesson_id_52b19e73;
DROP INDEX public.lessons_lessonassignment_dataset_id_07c252d8;
DROP INDEX public.lessons_lessonassignment_collection_id_d30ca20a;
DROP INDEX public.lessons_lessonassignment_assigned_by_id_ed8b2358;
DROP INDEX public.lessons_lesson_dataset_id_da71bead;
DROP INDEX public.lessons_lesson_created_by_id_441dbacf;
DROP INDEX public.lessons_lesson_collection_id_13b7d040;
DROP INDEX public.kolibriauth_role_user_id_d4014967;
DROP INDEX public.kolibriauth_role_dataset_id_70eb0469;
DROP INDEX public.kolibriauth_role_collection_id_1fa9ce6f;
DROP INDEX public.kolibriauth_membership_user_id_79317fa1;
DROP INDEX public.kolibriauth_membership_dataset_id_13e29803;
DROP INDEX public.kolibriauth_membership_collection_id_c955dbd2;
DROP INDEX public.kolibriauth_facilityuser_facility_id_f602d621;
DROP INDEX public.kolibriauth_facilityuser_dataset_id_0dab63f9;
DROP INDEX public.kolibriauth_collection_tree_id_07cebdf6;
DROP INDEX public.kolibriauth_collection_rght_54dc9abb;
DROP INDEX public.kolibriauth_collection_parent_id_1561ec4a;
DROP INDEX public.kolibriauth_collection_lft_ee90bb3a;
DROP INDEX public.kolibriauth_collection_level_4af376dc;
DROP INDEX public.kolibriauth_collection_dataset_id_5689c7d8;
DROP INDEX public.exams_examassignment_exam_id_d7c499da;
DROP INDEX public.exams_examassignment_dataset_id_3200aa09;
DROP INDEX public.exams_examassignment_collection_id_90ec6a7a;
DROP INDEX public.exams_examassignment_assigned_by_id_53aa193a;
DROP INDEX public.exams_exam_dataset_id_7dff1bad;
DROP INDEX public.exams_exam_creator_id_37d1b2e5;
DROP INDEX public.exams_exam_collection_id_9dc0b187;
DROP INDEX public.django_session_session_key_c0390e0f_like;
DROP INDEX public.django_session_expire_date_a5c62663;
DROP INDEX public.django_admin_log_user_id_c564eba6;
DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
DROP INDEX public.device_devicesettings_default_facility_id_8937e0b7;
DROP INDEX public.content_localfile_id_a2a9e67d_like;
DROP INDEX public.content_language_lang_subcode_6ca3c58e_like;
DROP INDEX public.content_language_lang_subcode_6ca3c58e;
DROP INDEX public.content_language_lang_code_7a423afe_like;
DROP INDEX public.content_language_lang_code_7a423afe;
DROP INDEX public.content_language_id_e9f35e8f_like;
DROP INDEX public.content_file_priority_073dafe4;
DROP INDEX public.content_file_local_file_id_9780c2ab_like;
DROP INDEX public.content_file_local_file_id_9780c2ab;
DROP INDEX public.content_file_lang_id_364540cd_like;
DROP INDEX public.content_file_lang_id_364540cd;
DROP INDEX public.content_file_contentnode_id_d4089e6e;
DROP INDEX public.content_contentnode_tree_id_d115ca94;
DROP INDEX public.content_contentnode_tags_contenttag_id_9518e093;
DROP INDEX public.content_contentnode_tags_contentnode_id_4ea196dd;
DROP INDEX public.content_contentnode_rght_33f2973d;
DROP INDEX public.content_contentnode_related_to_contentnode_id_42e82421;
DROP INDEX public.content_contentnode_related_from_contentnode_id_f56e3999;
DROP INDEX public.content_contentnode_parent_id_47178783;
DROP INDEX public.content_contentnode_lft_4253d420;
DROP INDEX public.content_contentnode_level_channel_id_kind_fd732cc4_idx;
DROP INDEX public.content_contentnode_level_channel_id_available_29f0bb18_idx;
DROP INDEX public.content_contentnode_level_9ffc3b01;
DROP INDEX public.content_contentnode_lang_id_600d594b_like;
DROP INDEX public.content_contentnode_lang_id_600d594b;
DROP INDEX public.content_contentnode_has_prerequisite_to_contentnode_id_5561f92c;
DROP INDEX public.content_contentnode_has_pr_from_contentnode_id_1085c145;
DROP INDEX public.content_contentnode_content_id_790eac82;
DROP INDEX public.content_contentnode_channel_id_77d3faec;
DROP INDEX public.content_channelmetadata_root_id_ba963469;
DROP INDEX public.content_assessmentmetadata_contentnode_id_19cbc70a;
DROP INDEX public.auth_permission_content_type_id_2f476e4b;
DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
DROP INDEX public.auth_group_name_a6ea08ec_like;
ALTER TABLE ONLY public.morango_transfersession DROP CONSTRAINT morango_transfersession_pkey;
ALTER TABLE ONLY public.morango_syncsession DROP CONSTRAINT morango_syncsession_pkey;
ALTER TABLE ONLY public.morango_store DROP CONSTRAINT morango_store_pkey;
ALTER TABLE ONLY public.morango_scopedefinition DROP CONSTRAINT morango_scopedefinition_pkey;
ALTER TABLE ONLY public.morango_recordmaxcounterbuffer DROP CONSTRAINT morango_recordmaxcounterbuffer_pkey;
ALTER TABLE ONLY public.morango_recordmaxcounter DROP CONSTRAINT morango_recordmaxcounter_store_model_id_instance__d478818f_uniq;
ALTER TABLE ONLY public.morango_recordmaxcounter DROP CONSTRAINT morango_recordmaxcounter_pkey;
ALTER TABLE ONLY public.morango_nonce DROP CONSTRAINT morango_nonce_pkey;
ALTER TABLE ONLY public.morango_instanceidmodel DROP CONSTRAINT morango_instanceidmodel_pkey;
ALTER TABLE ONLY public.morango_deletedmodels DROP CONSTRAINT morango_deletedmodels_pkey;
ALTER TABLE ONLY public.morango_databasemaxcounter DROP CONSTRAINT morango_databasemaxcounter_pkey;
ALTER TABLE ONLY public.morango_databasemaxcounter DROP CONSTRAINT morango_databasemaxcounter_instance_id_partition_99e4f1fb_uniq;
ALTER TABLE ONLY public.morango_databaseidmodel DROP CONSTRAINT morango_databaseidmodel_pkey;
ALTER TABLE ONLY public.morango_certificate DROP CONSTRAINT morango_certificate_pkey;
ALTER TABLE ONLY public.morango_buffer DROP CONSTRAINT morango_buffer_transfer_session_id_model_uuid_2a7288db_uniq;
ALTER TABLE ONLY public.morango_buffer DROP CONSTRAINT morango_buffer_pkey;
ALTER TABLE ONLY public.logger_usersessionlog DROP CONSTRAINT logger_usersessionlog_pkey;
ALTER TABLE ONLY public.logger_masterylog DROP CONSTRAINT logger_masterylog_pkey;
ALTER TABLE ONLY public.logger_examlog DROP CONSTRAINT logger_examlog_pkey;
ALTER TABLE ONLY public.logger_examattemptlog DROP CONSTRAINT logger_examattemptlog_pkey;
ALTER TABLE ONLY public.logger_contentsummarylog DROP CONSTRAINT logger_contentsummarylog_pkey;
ALTER TABLE ONLY public.logger_contentsessionlog DROP CONSTRAINT logger_contentsessionlog_pkey;
ALTER TABLE ONLY public.logger_attemptlog DROP CONSTRAINT logger_attemptlog_pkey;
ALTER TABLE ONLY public.lessons_lessonassignment DROP CONSTRAINT lessons_lessonassignment_pkey;
ALTER TABLE ONLY public.lessons_lesson DROP CONSTRAINT lessons_lesson_pkey;
ALTER TABLE ONLY public.kolibriauth_role DROP CONSTRAINT kolibriauth_role_user_id_collection_id_kind_9c51e8a2_uniq;
ALTER TABLE ONLY public.kolibriauth_role DROP CONSTRAINT kolibriauth_role_pkey;
ALTER TABLE ONLY public.kolibriauth_membership DROP CONSTRAINT kolibriauth_membership_user_id_collection_id_48b95423_uniq;
ALTER TABLE ONLY public.kolibriauth_membership DROP CONSTRAINT kolibriauth_membership_pkey;
ALTER TABLE ONLY public.kolibriauth_facilityuser DROP CONSTRAINT kolibriauth_facilityuser_pkey;
ALTER TABLE ONLY public.kolibriauth_facilitydataset DROP CONSTRAINT kolibriauth_facilitydataset_pkey;
ALTER TABLE ONLY public.kolibriauth_collection DROP CONSTRAINT kolibriauth_collection_pkey;
ALTER TABLE ONLY public.exams_examassignment DROP CONSTRAINT exams_examassignment_pkey;
ALTER TABLE ONLY public.exams_exam DROP CONSTRAINT exams_exam_pkey;
ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
ALTER TABLE ONLY public.device_devicesettings DROP CONSTRAINT device_devicesettings_pkey;
ALTER TABLE ONLY public.device_devicepermissions DROP CONSTRAINT device_devicepermissions_pkey;
ALTER TABLE ONLY public.content_localfile DROP CONSTRAINT content_localfile_pkey;
ALTER TABLE ONLY public.content_language DROP CONSTRAINT content_language_pkey;
ALTER TABLE ONLY public.content_file DROP CONSTRAINT content_file_pkey;
ALTER TABLE ONLY public.content_contenttag DROP CONSTRAINT content_contenttag_pkey;
ALTER TABLE ONLY public.content_contentnode_tags DROP CONSTRAINT content_contentnode_tags_pkey;
ALTER TABLE ONLY public.content_contentnode_tags DROP CONSTRAINT content_contentnode_tags_contentnode_id_contentta_64a4ac15_uniq;
ALTER TABLE ONLY public.content_contentnode_related DROP CONSTRAINT content_contentnode_related_pkey;
ALTER TABLE ONLY public.content_contentnode_related DROP CONSTRAINT content_contentnode_rela_from_contentnode_id_to_c_fc2ed20c_uniq;
ALTER TABLE ONLY public.content_contentnode DROP CONSTRAINT content_contentnode_pkey;
ALTER TABLE ONLY public.content_contentnode_has_prerequisite DROP CONSTRAINT content_contentnode_has_prerequisite_pkey;
ALTER TABLE ONLY public.content_contentnode_has_prerequisite DROP CONSTRAINT content_contentnode_has__from_contentnode_id_to_c_c9e1d527_uniq;
ALTER TABLE ONLY public.content_channelmetadata DROP CONSTRAINT content_channelmetadata_pkey;
ALTER TABLE ONLY public.content_assessmentmetadata DROP CONSTRAINT content_assessmentmetadata_pkey;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
ALTER TABLE public.morango_recordmaxcounterbuffer ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.morango_recordmaxcounter ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.morango_databasemaxcounter ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.morango_buffer ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.device_devicesettings ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.content_contentnode_tags ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.content_contentnode_related ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.content_contentnode_has_prerequisite ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
DROP TABLE public.morango_transfersession;
DROP TABLE public.morango_syncsession;
DROP TABLE public.morango_store;
DROP TABLE public.morango_scopedefinition;
DROP SEQUENCE public.morango_recordmaxcounterbuffer_id_seq;
DROP TABLE public.morango_recordmaxcounterbuffer;
DROP SEQUENCE public.morango_recordmaxcounter_id_seq;
DROP TABLE public.morango_recordmaxcounter;
DROP TABLE public.morango_nonce;
DROP TABLE public.morango_instanceidmodel;
DROP TABLE public.morango_deletedmodels;
DROP SEQUENCE public.morango_databasemaxcounter_id_seq;
DROP TABLE public.morango_databasemaxcounter;
DROP TABLE public.morango_databaseidmodel;
DROP TABLE public.morango_certificate;
DROP SEQUENCE public.morango_buffer_id_seq;
DROP TABLE public.morango_buffer;
DROP TABLE public.logger_usersessionlog;
DROP TABLE public.logger_masterylog;
DROP TABLE public.logger_examlog;
DROP TABLE public.logger_examattemptlog;
DROP TABLE public.logger_contentsummarylog;
DROP TABLE public.logger_contentsessionlog;
DROP TABLE public.logger_attemptlog;
DROP TABLE public.lessons_lessonassignment;
DROP TABLE public.lessons_lesson;
DROP TABLE public.kolibriauth_role;
DROP TABLE public.kolibriauth_membership;
DROP TABLE public.kolibriauth_facilityuser;
DROP TABLE public.kolibriauth_facilitydataset;
DROP TABLE public.kolibriauth_collection;
DROP TABLE public.exams_examassignment;
DROP TABLE public.exams_exam;
DROP TABLE public.django_session;
DROP SEQUENCE public.django_migrations_id_seq;
DROP TABLE public.django_migrations;
DROP SEQUENCE public.django_content_type_id_seq;
DROP TABLE public.django_content_type;
DROP SEQUENCE public.django_admin_log_id_seq;
DROP TABLE public.django_admin_log;
DROP SEQUENCE public.device_devicesettings_id_seq;
DROP TABLE public.device_devicesettings;
DROP TABLE public.device_devicepermissions;
DROP TABLE public.content_localfile;
DROP TABLE public.content_language;
DROP TABLE public.content_file;
DROP TABLE public.content_contenttag;
DROP SEQUENCE public.content_contentnode_tags_id_seq;
DROP TABLE public.content_contentnode_tags;
DROP SEQUENCE public.content_contentnode_related_id_seq;
DROP TABLE public.content_contentnode_related;
DROP SEQUENCE public.content_contentnode_has_prerequisite_id_seq;
DROP TABLE public.content_contentnode_has_prerequisite;
DROP TABLE public.content_contentnode;
DROP TABLE public.content_channelmetadata;
DROP TABLE public.content_assessmentmetadata;
DROP SEQUENCE public.auth_permission_id_seq;
DROP TABLE public.auth_permission;
DROP SEQUENCE public.auth_group_permissions_id_seq;
DROP TABLE public.auth_group_permissions;
DROP SEQUENCE public.auth_group_id_seq;
DROP TABLE public.auth_group;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: content_assessmentmetadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.content_assessmentmetadata (
    id uuid NOT NULL,
    assessment_item_ids text NOT NULL,
    number_of_assessments integer NOT NULL,
    mastery_model text NOT NULL,
    randomize boolean NOT NULL,
    is_manipulable boolean NOT NULL,
    contentnode_id uuid NOT NULL
);


ALTER TABLE public.content_assessmentmetadata OWNER TO postgres;

--
-- Name: content_channelmetadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.content_channelmetadata (
    id uuid NOT NULL,
    name character varying(200) NOT NULL,
    description character varying(400) NOT NULL,
    author character varying(400) NOT NULL,
    version integer NOT NULL,
    thumbnail text NOT NULL,
    last_updated character varying,
    min_schema_version character varying(50) NOT NULL,
    root_id uuid NOT NULL
);


ALTER TABLE public.content_channelmetadata OWNER TO postgres;

--
-- Name: content_contentnode; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.content_contentnode (
    id uuid NOT NULL,
    title character varying(200) NOT NULL,
    content_id uuid NOT NULL,
    channel_id uuid NOT NULL,
    description text,
    sort_order double precision,
    license_owner character varying(200) NOT NULL,
    author character varying(200) NOT NULL,
    kind character varying(200) NOT NULL,
    available boolean NOT NULL,
    stemmed_metaphone character varying(1800) NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    lang_id character varying(14),
    parent_id uuid,
    license_description text,
    license_name character varying(50),
    coach_content boolean NOT NULL,
    CONSTRAINT content_contentnode_level_check CHECK ((level >= 0)),
    CONSTRAINT content_contentnode_lft_check CHECK ((lft >= 0)),
    CONSTRAINT content_contentnode_rght_check CHECK ((rght >= 0)),
    CONSTRAINT content_contentnode_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.content_contentnode OWNER TO postgres;

--
-- Name: content_contentnode_has_prerequisite; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.content_contentnode_has_prerequisite (
    id integer NOT NULL,
    from_contentnode_id uuid NOT NULL,
    to_contentnode_id uuid NOT NULL
);


ALTER TABLE public.content_contentnode_has_prerequisite OWNER TO postgres;

--
-- Name: content_contentnode_has_prerequisite_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.content_contentnode_has_prerequisite_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.content_contentnode_has_prerequisite_id_seq OWNER TO postgres;

--
-- Name: content_contentnode_has_prerequisite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.content_contentnode_has_prerequisite_id_seq OWNED BY public.content_contentnode_has_prerequisite.id;


--
-- Name: content_contentnode_related; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.content_contentnode_related (
    id integer NOT NULL,
    from_contentnode_id uuid NOT NULL,
    to_contentnode_id uuid NOT NULL
);


ALTER TABLE public.content_contentnode_related OWNER TO postgres;

--
-- Name: content_contentnode_related_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.content_contentnode_related_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.content_contentnode_related_id_seq OWNER TO postgres;

--
-- Name: content_contentnode_related_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.content_contentnode_related_id_seq OWNED BY public.content_contentnode_related.id;


--
-- Name: content_contentnode_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.content_contentnode_tags (
    id integer NOT NULL,
    contentnode_id uuid NOT NULL,
    contenttag_id uuid NOT NULL
);


ALTER TABLE public.content_contentnode_tags OWNER TO postgres;

--
-- Name: content_contentnode_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.content_contentnode_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.content_contentnode_tags_id_seq OWNER TO postgres;

--
-- Name: content_contentnode_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.content_contentnode_tags_id_seq OWNED BY public.content_contentnode_tags.id;


--
-- Name: content_contenttag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.content_contenttag (
    id uuid NOT NULL,
    tag_name character varying(30) NOT NULL
);


ALTER TABLE public.content_contenttag OWNER TO postgres;

--
-- Name: content_file; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.content_file (
    id uuid NOT NULL,
    available boolean NOT NULL,
    preset character varying(150) NOT NULL,
    supplementary boolean NOT NULL,
    thumbnail boolean NOT NULL,
    priority integer,
    contentnode_id uuid NOT NULL,
    lang_id character varying(14),
    local_file_id character varying(32) NOT NULL
);


ALTER TABLE public.content_file OWNER TO postgres;

--
-- Name: content_language; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.content_language (
    id character varying(14) NOT NULL,
    lang_code character varying(3) NOT NULL,
    lang_subcode character varying(10),
    lang_name character varying(100),
    lang_direction character varying(3) NOT NULL
);


ALTER TABLE public.content_language OWNER TO postgres;

--
-- Name: content_localfile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.content_localfile (
    id character varying(32) NOT NULL,
    extension character varying(40) NOT NULL,
    available boolean NOT NULL,
    file_size integer
);


ALTER TABLE public.content_localfile OWNER TO postgres;

--
-- Name: device_devicepermissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.device_devicepermissions (
    user_id uuid NOT NULL,
    is_superuser boolean NOT NULL,
    can_manage_content boolean NOT NULL
);


ALTER TABLE public.device_devicepermissions OWNER TO postgres;

--
-- Name: device_devicesettings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.device_devicesettings (
    id integer NOT NULL,
    is_provisioned boolean NOT NULL,
    language_id character varying(15) NOT NULL,
    default_facility_id uuid
);


ALTER TABLE public.device_devicesettings OWNER TO postgres;

--
-- Name: device_devicesettings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.device_devicesettings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.device_devicesettings_id_seq OWNER TO postgres;

--
-- Name: device_devicesettings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.device_devicesettings_id_seq OWNED BY public.device_devicesettings.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id uuid NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: exams_exam; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exams_exam (
    id uuid NOT NULL,
    _morango_dirty_bit boolean NOT NULL,
    _morango_source_id character varying(96) NOT NULL,
    _morango_partition character varying(128) NOT NULL,
    title character varying(200) NOT NULL,
    channel_id character varying(32) NOT NULL,
    question_count integer NOT NULL,
    question_sources text NOT NULL,
    seed integer NOT NULL,
    active boolean NOT NULL,
    archive boolean NOT NULL,
    collection_id uuid NOT NULL,
    creator_id uuid NOT NULL,
    dataset_id uuid NOT NULL
);


ALTER TABLE public.exams_exam OWNER TO postgres;

--
-- Name: exams_examassignment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exams_examassignment (
    id uuid NOT NULL,
    _morango_dirty_bit boolean NOT NULL,
    _morango_source_id character varying(96) NOT NULL,
    _morango_partition character varying(128) NOT NULL,
    assigned_by_id uuid NOT NULL,
    collection_id uuid NOT NULL,
    dataset_id uuid NOT NULL,
    exam_id uuid NOT NULL
);


ALTER TABLE public.exams_examassignment OWNER TO postgres;

--
-- Name: kolibriauth_collection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kolibriauth_collection (
    id uuid NOT NULL,
    _morango_dirty_bit boolean NOT NULL,
    _morango_source_id character varying(96) NOT NULL,
    _morango_partition character varying(128) NOT NULL,
    name character varying(100) NOT NULL,
    kind character varying(20) NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    dataset_id uuid NOT NULL,
    parent_id uuid,
    CONSTRAINT kolibriauth_collection_level_check CHECK ((level >= 0)),
    CONSTRAINT kolibriauth_collection_lft_check CHECK ((lft >= 0)),
    CONSTRAINT kolibriauth_collection_rght_check CHECK ((rght >= 0)),
    CONSTRAINT kolibriauth_collection_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.kolibriauth_collection OWNER TO postgres;

--
-- Name: kolibriauth_facilitydataset; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kolibriauth_facilitydataset (
    id uuid NOT NULL,
    _morango_dirty_bit boolean NOT NULL,
    _morango_source_id character varying(96) NOT NULL,
    _morango_partition character varying(128) NOT NULL,
    description text NOT NULL,
    location character varying(200) NOT NULL,
    learner_can_edit_username boolean NOT NULL,
    learner_can_edit_name boolean NOT NULL,
    learner_can_edit_password boolean NOT NULL,
    learner_can_sign_up boolean NOT NULL,
    learner_can_delete_account boolean NOT NULL,
    learner_can_login_with_no_password boolean NOT NULL,
    preset character varying(50) NOT NULL,
    show_download_button_in_learn boolean NOT NULL
);


ALTER TABLE public.kolibriauth_facilitydataset OWNER TO postgres;

--
-- Name: kolibriauth_facilityuser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kolibriauth_facilityuser (
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    id uuid NOT NULL,
    _morango_dirty_bit boolean NOT NULL,
    _morango_source_id character varying(96) NOT NULL,
    _morango_partition character varying(128) NOT NULL,
    username character varying(30) NOT NULL,
    full_name character varying(120) NOT NULL,
    date_joined character varying NOT NULL,
    dataset_id uuid NOT NULL,
    facility_id uuid NOT NULL
);


ALTER TABLE public.kolibriauth_facilityuser OWNER TO postgres;

--
-- Name: kolibriauth_membership; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kolibriauth_membership (
    id uuid NOT NULL,
    _morango_dirty_bit boolean NOT NULL,
    _morango_source_id character varying(96) NOT NULL,
    _morango_partition character varying(128) NOT NULL,
    collection_id uuid NOT NULL,
    dataset_id uuid NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.kolibriauth_membership OWNER TO postgres;

--
-- Name: kolibriauth_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kolibriauth_role (
    id uuid NOT NULL,
    _morango_dirty_bit boolean NOT NULL,
    _morango_source_id character varying(96) NOT NULL,
    _morango_partition character varying(128) NOT NULL,
    kind character varying(26) NOT NULL,
    collection_id uuid NOT NULL,
    dataset_id uuid NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.kolibriauth_role OWNER TO postgres;

--
-- Name: lessons_lesson; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lessons_lesson (
    id uuid NOT NULL,
    _morango_dirty_bit boolean NOT NULL,
    _morango_source_id character varying(96) NOT NULL,
    _morango_partition character varying(128) NOT NULL,
    title character varying(50) NOT NULL,
    description character varying(200) NOT NULL,
    resources text NOT NULL,
    is_active boolean NOT NULL,
    collection_id uuid NOT NULL,
    created_by_id uuid NOT NULL,
    dataset_id uuid NOT NULL,
    date_created character varying NOT NULL
);


ALTER TABLE public.lessons_lesson OWNER TO postgres;

--
-- Name: lessons_lessonassignment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lessons_lessonassignment (
    id uuid NOT NULL,
    _morango_dirty_bit boolean NOT NULL,
    _morango_source_id character varying(96) NOT NULL,
    _morango_partition character varying(128) NOT NULL,
    assigned_by_id uuid NOT NULL,
    collection_id uuid NOT NULL,
    dataset_id uuid NOT NULL,
    lesson_id uuid NOT NULL
);


ALTER TABLE public.lessons_lessonassignment OWNER TO postgres;

--
-- Name: logger_attemptlog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logger_attemptlog (
    id uuid NOT NULL,
    _morango_dirty_bit boolean NOT NULL,
    _morango_source_id character varying(96) NOT NULL,
    _morango_partition character varying(128) NOT NULL,
    item character varying(200) NOT NULL,
    start_timestamp character varying NOT NULL,
    end_timestamp character varying NOT NULL,
    completion_timestamp character varying,
    time_spent double precision NOT NULL,
    complete boolean NOT NULL,
    correct double precision NOT NULL,
    hinted boolean NOT NULL,
    answer text,
    simple_answer character varying(200) NOT NULL,
    interaction_history text NOT NULL,
    dataset_id uuid NOT NULL,
    masterylog_id uuid,
    sessionlog_id uuid NOT NULL,
    user_id uuid
);


ALTER TABLE public.logger_attemptlog OWNER TO postgres;

--
-- Name: logger_contentsessionlog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logger_contentsessionlog (
    id uuid NOT NULL,
    _morango_dirty_bit boolean NOT NULL,
    _morango_source_id character varying(96) NOT NULL,
    _morango_partition character varying(128) NOT NULL,
    content_id uuid NOT NULL,
    channel_id uuid NOT NULL,
    start_timestamp character varying NOT NULL,
    end_timestamp character varying,
    time_spent double precision NOT NULL,
    progress double precision NOT NULL,
    kind character varying(200) NOT NULL,
    extra_fields text NOT NULL,
    dataset_id uuid NOT NULL,
    user_id uuid
);


ALTER TABLE public.logger_contentsessionlog OWNER TO postgres;

--
-- Name: logger_contentsummarylog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logger_contentsummarylog (
    id uuid NOT NULL,
    _morango_dirty_bit boolean NOT NULL,
    _morango_source_id character varying(96) NOT NULL,
    _morango_partition character varying(128) NOT NULL,
    content_id uuid NOT NULL,
    channel_id uuid NOT NULL,
    start_timestamp character varying NOT NULL,
    end_timestamp character varying,
    completion_timestamp character varying,
    time_spent double precision NOT NULL,
    progress double precision NOT NULL,
    kind character varying(200) NOT NULL,
    extra_fields text NOT NULL,
    dataset_id uuid NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.logger_contentsummarylog OWNER TO postgres;

--
-- Name: logger_examattemptlog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logger_examattemptlog (
    id uuid NOT NULL,
    _morango_dirty_bit boolean NOT NULL,
    _morango_source_id character varying(96) NOT NULL,
    _morango_partition character varying(128) NOT NULL,
    item character varying(200) NOT NULL,
    start_timestamp character varying NOT NULL,
    end_timestamp character varying NOT NULL,
    completion_timestamp character varying,
    time_spent double precision NOT NULL,
    complete boolean NOT NULL,
    correct double precision NOT NULL,
    hinted boolean NOT NULL,
    answer text,
    simple_answer character varying(200) NOT NULL,
    interaction_history text NOT NULL,
    content_id uuid NOT NULL,
    channel_id uuid NOT NULL,
    dataset_id uuid NOT NULL,
    examlog_id uuid NOT NULL,
    user_id uuid
);


ALTER TABLE public.logger_examattemptlog OWNER TO postgres;

--
-- Name: logger_examlog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logger_examlog (
    id uuid NOT NULL,
    _morango_dirty_bit boolean NOT NULL,
    _morango_source_id character varying(96) NOT NULL,
    _morango_partition character varying(128) NOT NULL,
    closed boolean NOT NULL,
    completion_timestamp character varying,
    dataset_id uuid NOT NULL,
    exam_id uuid NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.logger_examlog OWNER TO postgres;

--
-- Name: logger_masterylog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logger_masterylog (
    id uuid NOT NULL,
    _morango_dirty_bit boolean NOT NULL,
    _morango_source_id character varying(96) NOT NULL,
    _morango_partition character varying(128) NOT NULL,
    mastery_criterion text NOT NULL,
    start_timestamp character varying NOT NULL,
    end_timestamp character varying,
    completion_timestamp character varying,
    mastery_level integer NOT NULL,
    complete boolean NOT NULL,
    dataset_id uuid NOT NULL,
    summarylog_id uuid NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.logger_masterylog OWNER TO postgres;

--
-- Name: logger_usersessionlog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logger_usersessionlog (
    id uuid NOT NULL,
    _morango_dirty_bit boolean NOT NULL,
    _morango_source_id character varying(96) NOT NULL,
    _morango_partition character varying(128) NOT NULL,
    channels text NOT NULL,
    start_timestamp character varying NOT NULL,
    last_interaction_timestamp character varying,
    pages text NOT NULL,
    dataset_id uuid NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.logger_usersessionlog OWNER TO postgres;

--
-- Name: morango_buffer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.morango_buffer (
    id integer NOT NULL,
    serialized text NOT NULL,
    deleted boolean NOT NULL,
    last_saved_instance uuid NOT NULL,
    last_saved_counter integer NOT NULL,
    model_name character varying(40) NOT NULL,
    profile character varying(40) NOT NULL,
    partition text NOT NULL,
    model_uuid uuid NOT NULL,
    transfer_session_id uuid NOT NULL,
    conflicting_serialized_data text NOT NULL,
    _self_ref_fk character varying(32) NOT NULL,
    source_id character varying(96) NOT NULL
);


ALTER TABLE public.morango_buffer OWNER TO postgres;

--
-- Name: morango_buffer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.morango_buffer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.morango_buffer_id_seq OWNER TO postgres;

--
-- Name: morango_buffer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.morango_buffer_id_seq OWNED BY public.morango_buffer.id;


--
-- Name: morango_certificate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.morango_certificate (
    id uuid NOT NULL,
    profile character varying(20) NOT NULL,
    scope_version integer NOT NULL,
    scope_params text NOT NULL,
    public_key text NOT NULL,
    serialized text NOT NULL,
    signature text NOT NULL,
    private_key text,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    parent_id uuid,
    scope_definition_id character varying(20) NOT NULL,
    salt character varying(32) NOT NULL,
    CONSTRAINT morango_certificate_level_check CHECK ((level >= 0)),
    CONSTRAINT morango_certificate_lft_check CHECK ((lft >= 0)),
    CONSTRAINT morango_certificate_rght_check CHECK ((rght >= 0)),
    CONSTRAINT morango_certificate_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.morango_certificate OWNER TO postgres;

--
-- Name: morango_databaseidmodel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.morango_databaseidmodel (
    id uuid NOT NULL,
    current boolean NOT NULL,
    date_generated timestamp with time zone NOT NULL,
    initial_instance_id character varying(32) NOT NULL
);


ALTER TABLE public.morango_databaseidmodel OWNER TO postgres;

--
-- Name: morango_databasemaxcounter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.morango_databasemaxcounter (
    id integer NOT NULL,
    instance_id uuid NOT NULL,
    counter integer NOT NULL,
    partition character varying(128) NOT NULL
);


ALTER TABLE public.morango_databasemaxcounter OWNER TO postgres;

--
-- Name: morango_databasemaxcounter_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.morango_databasemaxcounter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.morango_databasemaxcounter_id_seq OWNER TO postgres;

--
-- Name: morango_databasemaxcounter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.morango_databasemaxcounter_id_seq OWNED BY public.morango_databasemaxcounter.id;


--
-- Name: morango_deletedmodels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.morango_deletedmodels (
    id uuid NOT NULL,
    profile character varying(40) NOT NULL
);


ALTER TABLE public.morango_deletedmodels OWNER TO postgres;

--
-- Name: morango_instanceidmodel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.morango_instanceidmodel (
    id uuid NOT NULL,
    platform text NOT NULL,
    hostname text NOT NULL,
    sysversion text NOT NULL,
    node_id character varying(20) NOT NULL,
    counter integer NOT NULL,
    current boolean NOT NULL,
    db_path character varying(1000) NOT NULL,
    database_id uuid NOT NULL,
    system_id character varying(100) NOT NULL
);


ALTER TABLE public.morango_instanceidmodel OWNER TO postgres;

--
-- Name: morango_nonce; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.morango_nonce (
    id uuid NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    ip character varying(100) NOT NULL
);


ALTER TABLE public.morango_nonce OWNER TO postgres;

--
-- Name: morango_recordmaxcounter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.morango_recordmaxcounter (
    id integer NOT NULL,
    instance_id uuid NOT NULL,
    counter integer NOT NULL,
    store_model_id uuid NOT NULL
);


ALTER TABLE public.morango_recordmaxcounter OWNER TO postgres;

--
-- Name: morango_recordmaxcounter_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.morango_recordmaxcounter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.morango_recordmaxcounter_id_seq OWNER TO postgres;

--
-- Name: morango_recordmaxcounter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.morango_recordmaxcounter_id_seq OWNED BY public.morango_recordmaxcounter.id;


--
-- Name: morango_recordmaxcounterbuffer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.morango_recordmaxcounterbuffer (
    id integer NOT NULL,
    instance_id uuid NOT NULL,
    counter integer NOT NULL,
    model_uuid uuid NOT NULL,
    transfer_session_id uuid NOT NULL
);


ALTER TABLE public.morango_recordmaxcounterbuffer OWNER TO postgres;

--
-- Name: morango_recordmaxcounterbuffer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.morango_recordmaxcounterbuffer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.morango_recordmaxcounterbuffer_id_seq OWNER TO postgres;

--
-- Name: morango_recordmaxcounterbuffer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.morango_recordmaxcounterbuffer_id_seq OWNED BY public.morango_recordmaxcounterbuffer.id;


--
-- Name: morango_scopedefinition; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.morango_scopedefinition (
    profile character varying(20) NOT NULL,
    version integer NOT NULL,
    id character varying(20) NOT NULL,
    description text NOT NULL,
    read_filter_template text NOT NULL,
    write_filter_template text NOT NULL,
    read_write_filter_template text NOT NULL,
    primary_scope_param_key character varying(20) NOT NULL
);


ALTER TABLE public.morango_scopedefinition OWNER TO postgres;

--
-- Name: morango_store; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.morango_store (
    serialized text NOT NULL,
    deleted boolean NOT NULL,
    last_saved_instance uuid NOT NULL,
    last_saved_counter integer NOT NULL,
    model_name character varying(40) NOT NULL,
    profile character varying(40) NOT NULL,
    partition text NOT NULL,
    id uuid NOT NULL,
    conflicting_serialized_data text NOT NULL,
    _self_ref_fk character varying(32) NOT NULL,
    dirty_bit boolean NOT NULL,
    source_id character varying(96) NOT NULL
);


ALTER TABLE public.morango_store OWNER TO postgres;

--
-- Name: morango_syncsession; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.morango_syncsession (
    id uuid NOT NULL,
    start_timestamp timestamp with time zone NOT NULL,
    last_activity_timestamp timestamp with time zone NOT NULL,
    active boolean NOT NULL,
    connection_kind character varying(10) NOT NULL,
    connection_path character varying(1000) NOT NULL,
    is_server boolean NOT NULL,
    client_instance text NOT NULL,
    client_ip character varying(100) NOT NULL,
    profile character varying(40) NOT NULL,
    server_instance text NOT NULL,
    server_ip character varying(100) NOT NULL,
    client_certificate_id uuid,
    server_certificate_id uuid
);


ALTER TABLE public.morango_syncsession OWNER TO postgres;

--
-- Name: morango_transfersession; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.morango_transfersession (
    id uuid NOT NULL,
    filter text NOT NULL,
    push boolean NOT NULL,
    active boolean NOT NULL,
    records_total integer,
    sync_session_id uuid NOT NULL,
    last_activity_timestamp timestamp with time zone NOT NULL,
    client_fsic text NOT NULL,
    records_transferred integer NOT NULL,
    server_fsic text NOT NULL,
    start_timestamp timestamp with time zone NOT NULL
);


ALTER TABLE public.morango_transfersession OWNER TO postgres;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: content_contentnode_has_prerequisite id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_contentnode_has_prerequisite ALTER COLUMN id SET DEFAULT nextval('public.content_contentnode_has_prerequisite_id_seq'::regclass);


--
-- Name: content_contentnode_related id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_contentnode_related ALTER COLUMN id SET DEFAULT nextval('public.content_contentnode_related_id_seq'::regclass);


--
-- Name: content_contentnode_tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_contentnode_tags ALTER COLUMN id SET DEFAULT nextval('public.content_contentnode_tags_id_seq'::regclass);


--
-- Name: device_devicesettings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_devicesettings ALTER COLUMN id SET DEFAULT nextval('public.device_devicesettings_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: morango_buffer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.morango_buffer ALTER COLUMN id SET DEFAULT nextval('public.morango_buffer_id_seq'::regclass);


--
-- Name: morango_databasemaxcounter id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.morango_databasemaxcounter ALTER COLUMN id SET DEFAULT nextval('public.morango_databasemaxcounter_id_seq'::regclass);


--
-- Name: morango_recordmaxcounter id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.morango_recordmaxcounter ALTER COLUMN id SET DEFAULT nextval('public.morango_recordmaxcounter_id_seq'::regclass);


--
-- Name: morango_recordmaxcounterbuffer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.morango_recordmaxcounterbuffer ALTER COLUMN id SET DEFAULT nextval('public.morango_recordmaxcounterbuffer_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add permission	3	add_permission
8	Can change permission	3	change_permission
9	Can delete permission	3	delete_permission
10	Can add content type	4	add_contenttype
11	Can change content type	4	change_contenttype
12	Can delete content type	4	delete_contenttype
13	Can add session	5	add_session
14	Can change session	5	change_session
15	Can delete session	5	delete_session
16	Can add collection	6	add_collection
17	Can change collection	6	change_collection
18	Can delete collection	6	delete_collection
19	Can add facility user	7	add_facilityuser
20	Can change facility user	7	change_facilityuser
21	Can delete facility user	7	delete_facilityuser
22	Can add facility dataset	8	add_facilitydataset
23	Can change facility dataset	8	change_facilitydataset
24	Can delete facility dataset	8	delete_facilitydataset
25	Can add facility	6	add_facility
26	Can change facility	6	change_facility
27	Can delete facility	6	delete_facility
28	Can add learner group	6	add_learnergroup
29	Can change learner group	6	change_learnergroup
30	Can delete learner group	6	delete_learnergroup
31	Can add membership	9	add_membership
32	Can change membership	9	change_membership
33	Can delete membership	9	delete_membership
34	Can add role	10	add_role
35	Can change role	10	change_role
36	Can delete role	10	delete_role
37	Can add classroom	6	add_classroom
38	Can change classroom	6	change_classroom
39	Can delete classroom	6	delete_classroom
40	Can add language	14	add_language
41	Can change language	14	change_language
42	Can delete language	14	delete_language
43	Can add channel metadata	15	add_channelmetadata
44	Can change channel metadata	15	change_channelmetadata
45	Can delete channel metadata	15	delete_channelmetadata
46	Can add local file	16	add_localfile
47	Can change local file	16	change_localfile
48	Can delete local file	16	delete_localfile
49	Can add file	17	add_file
50	Can change file	17	change_file
51	Can delete file	17	delete_file
52	Can add content tag	18	add_contenttag
53	Can change content tag	18	change_contenttag
54	Can delete content tag	18	delete_contenttag
55	Can add content node	19	add_contentnode
56	Can change content node	19	change_contentnode
57	Can delete content node	19	delete_contentnode
58	Can add assessment meta data	20	add_assessmentmetadata
59	Can change assessment meta data	20	change_assessmentmetadata
60	Can delete assessment meta data	20	delete_assessmentmetadata
61	Can add content summary log	21	add_contentsummarylog
62	Can change content summary log	21	change_contentsummarylog
63	Can delete content summary log	21	delete_contentsummarylog
64	Can add mastery log	22	add_masterylog
65	Can change mastery log	22	change_masterylog
66	Can delete mastery log	22	delete_masterylog
67	Can add user session log	23	add_usersessionlog
68	Can change user session log	23	change_usersessionlog
69	Can delete user session log	23	delete_usersessionlog
70	Can add content session log	24	add_contentsessionlog
71	Can change content session log	24	change_contentsessionlog
72	Can delete content session log	24	delete_contentsessionlog
73	Can add exam attempt log	25	add_examattemptlog
74	Can change exam attempt log	25	change_examattemptlog
75	Can delete exam attempt log	25	delete_examattemptlog
76	Can add attempt log	26	add_attemptlog
77	Can change attempt log	26	change_attemptlog
78	Can delete attempt log	26	delete_attemptlog
79	Can add exam log	27	add_examlog
80	Can change exam log	27	change_examlog
81	Can delete exam log	27	delete_examlog
82	Can add exam assignment	28	add_examassignment
83	Can change exam assignment	28	change_examassignment
84	Can delete exam assignment	28	delete_examassignment
85	Can add exam	29	add_exam
86	Can change exam	29	change_exam
87	Can delete exam	29	delete_exam
88	Can add device settings	30	add_devicesettings
89	Can change device settings	30	change_devicesettings
90	Can delete device settings	30	delete_devicesettings
91	Can add device permissions	31	add_devicepermissions
92	Can change device permissions	31	change_devicepermissions
93	Can delete device permissions	31	delete_devicepermissions
94	Can add lesson	32	add_lesson
95	Can change lesson	32	change_lesson
96	Can delete lesson	32	delete_lesson
97	Can add lesson assignment	33	add_lessonassignment
98	Can change lesson assignment	33	change_lessonassignment
99	Can delete lesson assignment	33	delete_lessonassignment
100	Can add transfer session	34	add_transfersession
101	Can change transfer session	34	change_transfersession
102	Can delete transfer session	34	delete_transfersession
103	Can add scope definition	35	add_scopedefinition
104	Can change scope definition	35	change_scopedefinition
105	Can delete scope definition	35	delete_scopedefinition
106	Can add certificate	36	add_certificate
107	Can change certificate	36	change_certificate
108	Can delete certificate	36	delete_certificate
109	Can add record max counter buffer	37	add_recordmaxcounterbuffer
110	Can change record max counter buffer	37	change_recordmaxcounterbuffer
111	Can delete record max counter buffer	37	delete_recordmaxcounterbuffer
112	Can add database id model	38	add_databaseidmodel
113	Can change database id model	38	change_databaseidmodel
114	Can delete database id model	38	delete_databaseidmodel
115	Can add database max counter	39	add_databasemaxcounter
116	Can change database max counter	39	change_databasemaxcounter
117	Can delete database max counter	39	delete_databasemaxcounter
118	Can add deleted models	40	add_deletedmodels
119	Can change deleted models	40	change_deletedmodels
120	Can delete deleted models	40	delete_deletedmodels
121	Can add instance id model	41	add_instanceidmodel
122	Can change instance id model	41	change_instanceidmodel
123	Can delete instance id model	41	delete_instanceidmodel
124	Can add store	42	add_store
125	Can change store	42	change_store
126	Can delete store	42	delete_store
127	Can add nonce	43	add_nonce
128	Can change nonce	43	change_nonce
129	Can delete nonce	43	delete_nonce
130	Can add record max counter	44	add_recordmaxcounter
131	Can change record max counter	44	change_recordmaxcounter
132	Can delete record max counter	44	delete_recordmaxcounter
133	Can add buffer	45	add_buffer
134	Can change buffer	45	change_buffer
135	Can delete buffer	45	delete_buffer
136	Can add sync session	46	add_syncsession
137	Can change sync session	46	change_syncsession
138	Can delete sync session	46	delete_syncsession
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 138, true);


--
-- Data for Name: content_assessmentmetadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.content_assessmentmetadata (id, assessment_item_ids, number_of_assessments, mastery_model, randomize, is_manipulable, contentnode_id) FROM stdin;
\.


--
-- Data for Name: content_channelmetadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.content_channelmetadata (id, name, description, author, version, thumbnail, last_updated, min_schema_version, root_id) FROM stdin;
\.


--
-- Data for Name: content_contentnode; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.content_contentnode (id, title, content_id, channel_id, description, sort_order, license_owner, author, kind, available, stemmed_metaphone, lft, rght, tree_id, level, lang_id, parent_id, license_description, license_name, coach_content) FROM stdin;
\.


--
-- Data for Name: content_contentnode_has_prerequisite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.content_contentnode_has_prerequisite (id, from_contentnode_id, to_contentnode_id) FROM stdin;
\.


--
-- Name: content_contentnode_has_prerequisite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.content_contentnode_has_prerequisite_id_seq', 1, false);


--
-- Data for Name: content_contentnode_related; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.content_contentnode_related (id, from_contentnode_id, to_contentnode_id) FROM stdin;
\.


--
-- Name: content_contentnode_related_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.content_contentnode_related_id_seq', 1, false);


--
-- Data for Name: content_contentnode_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.content_contentnode_tags (id, contentnode_id, contenttag_id) FROM stdin;
\.


--
-- Name: content_contentnode_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.content_contentnode_tags_id_seq', 1, false);


--
-- Data for Name: content_contenttag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.content_contenttag (id, tag_name) FROM stdin;
\.


--
-- Data for Name: content_file; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.content_file (id, available, preset, supplementary, thumbnail, priority, contentnode_id, lang_id, local_file_id) FROM stdin;
\.


--
-- Data for Name: content_language; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.content_language (id, lang_code, lang_subcode, lang_name, lang_direction) FROM stdin;
\.


--
-- Data for Name: content_localfile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.content_localfile (id, extension, available, file_size) FROM stdin;
\.


--
-- Data for Name: device_devicepermissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.device_devicepermissions (user_id, is_superuser, can_manage_content) FROM stdin;
ca9e1e4c-417c-729d-2de8-d7dc3b7df5f0	t	f
\.


--
-- Data for Name: device_devicesettings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.device_devicesettings (id, is_provisioned, language_id, default_facility_id) FROM stdin;
1	t	en	887d4ac3-460b-5341-bffd-a1bd1c196310
\.


--
-- Name: device_devicesettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.device_devicesettings_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	group
3	auth	permission
4	contenttypes	contenttype
5	sessions	session
6	kolibriauth	collection
7	kolibriauth	facilityuser
8	kolibriauth	facilitydataset
9	kolibriauth	membership
10	kolibriauth	role
11	kolibriauth	classroom
12	kolibriauth	facility
13	kolibriauth	learnergroup
14	content	language
15	content	channelmetadata
16	content	localfile
17	content	file
18	content	contenttag
19	content	contentnode
20	content	assessmentmetadata
21	logger	contentsummarylog
22	logger	masterylog
23	logger	usersessionlog
24	logger	contentsessionlog
25	logger	examattemptlog
26	logger	attemptlog
27	logger	examlog
28	exams	examassignment
29	exams	exam
30	device	devicesettings
31	device	devicepermissions
32	lessons	lesson
33	lessons	lessonassignment
34	morango	transfersession
35	morango	scopedefinition
36	morango	certificate
37	morango	recordmaxcounterbuffer
38	morango	databaseidmodel
39	morango	databasemaxcounter
40	morango	deletedmodels
41	morango	instanceidmodel
42	morango	store
43	morango	nonce
44	morango	recordmaxcounter
45	morango	buffer
46	morango	syncsession
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 46, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	kolibriauth	0001_initial	2018-05-11 15:22:49.790378+02
2	contenttypes	0001_initial	2018-05-11 15:22:49.835181+02
3	admin	0001_initial	2018-05-11 15:22:49.885041+02
4	admin	0002_logentry_remove_auto_add	2018-05-11 15:22:49.919786+02
5	contenttypes	0002_remove_content_type_name	2018-05-11 15:22:50.020962+02
6	auth	0001_initial	2018-05-11 15:22:50.149401+02
7	auth	0002_alter_permission_name_max_length	2018-05-11 15:22:50.16924+02
8	auth	0003_alter_user_email_max_length	2018-05-11 15:22:50.186407+02
9	auth	0004_alter_user_username_opts	2018-05-11 15:22:50.202502+02
10	auth	0005_alter_user_last_login_null	2018-05-11 15:22:50.220379+02
11	auth	0006_require_contenttypes_0002	2018-05-11 15:22:50.225562+02
12	auth	0007_alter_validators_add_error_messages	2018-05-11 15:22:50.249082+02
13	auth	0008_alter_user_username_max_length	2018-05-11 15:22:50.266797+02
14	content	0001_initial	2018-05-11 15:22:50.297908+02
15	content	0002_channelmetadatacache_last_updated	2018-05-11 15:22:50.319447+02
16	content	0003_auto_20170607_1212	2018-05-11 15:22:50.325466+02
17	content	0004_auto_20170825_1038	2018-05-11 15:22:50.957993+02
18	content	0005_auto_20171009_0903	2018-05-11 15:22:51.065494+02
19	content	0006_auto_20171128_1703	2018-05-11 15:22:51.107548+02
20	content	0007_auto_20180212_1155	2018-05-11 15:22:51.127967+02
21	content	0008_contentnode_coach_content	2018-05-11 15:22:51.22728+02
22	content	0009_auto_20180410_1139	2018-05-11 15:22:51.285566+02
23	content	0008_auto_20180429_1709	2018-05-11 15:22:51.349095+02
24	content	0010_merge_20180504_1540	2018-05-11 15:22:51.355288+02
25	kolibriauth	0002_auto_20170608_2125	2018-05-11 15:22:51.406396+02
26	kolibriauth	0003_auto_20170621_0958	2018-05-11 15:22:51.631368+02
27	device	0001_initial	2018-05-11 15:22:51.671915+02
28	device	0002_devicesettings_default_facility	2018-05-11 15:22:51.696856+02
29	exams	0001_initial	2018-05-11 15:22:51.821345+02
30	kolibriauth	0004_auto_20170816_1607	2018-05-11 15:22:51.892257+02
31	kolibriauth	0005_auto_20170818_1203	2018-05-11 15:22:51.94189+02
32	kolibriauth	0006_auto_20171206_1207	2018-05-11 15:22:52.109966+02
33	kolibriauth	0007_auto_20171226_1125	2018-05-11 15:22:52.207308+02
34	kolibriauth	0008_auto_20180222_1244	2018-05-11 15:22:52.251065+02
35	kolibriauth	0009_auto_20180301_1123	2018-05-11 15:22:52.291899+02
36	kolibriauth	0010_auto_20180320_1320	2018-05-11 15:22:52.342894+02
37	kolibriauth	0011_facilitydataset_show_download_button_in_learn	2018-05-11 15:22:52.401812+02
38	lessons	0001_initial	2018-05-11 15:22:52.540031+02
39	lessons	0002_auto_20180221_1115	2018-05-11 15:22:52.745307+02
40	logger	0001_initial	2018-05-11 15:22:53.737879+02
41	logger	0002_auto_20170518_1031	2018-05-11 15:22:56.365198+02
42	logger	0003_auto_20170531_1140	2018-05-11 15:22:56.417332+02
43	logger	0004_tidy_progress_range	2018-05-11 15:22:56.496492+02
44	morango	0001_initial	2018-05-11 15:22:57.040561+02
45	morango	0002_auto_20170511_0400	2018-05-11 15:22:57.286451+02
46	morango	0003_auto_20170519_0543	2018-05-11 15:22:57.374378+02
47	morango	0004_auto_20170520_2112	2018-05-11 15:22:57.430141+02
48	morango	0005_auto_20170629_2139	2018-05-11 15:22:57.555973+02
49	morango	0006_instanceidmodel_system_id	2018-05-11 15:22:57.587231+02
50	morango	0007_auto_20171018_1615	2018-05-11 15:22:58.554052+02
51	morango	0008_auto_20171114_2217	2018-05-11 15:22:58.738072+02
52	morango	0009_auto_20171205_0252	2018-05-11 15:22:58.753112+02
53	morango	0010_auto_20171206_1615	2018-05-11 15:22:58.805982+02
54	sessions	0001_initial	2018-05-11 15:22:58.843351+02
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 54, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
x26sfcqsc898gtf5rzxzzokiju2ev4df	YzQ5OWY2MGI1MWM4YWJlNWQ4ZGI5ZDg4MDY5OTljMmRiMmI3MTliYjp7InN1cHBvcnRlZF9icm93c2VyIjp0cnVlLCJfYXV0aF91c2VyX2hhc2giOiI3YzJkNjIzODBhZmVlYmI3OWUxMmFkZGVkOTYzMTQwZGU5MjU5MWVkIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoia29saWJyaS5hdXRoLmJhY2tlbmRzLkZhY2lsaXR5VXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiY2E5ZTFlNGM0MTdjNzI5ZDJkZThkN2RjM2I3ZGY1ZjAiLCJsYXN0X3Nlc3Npb25fcmVxdWVzdCI6MTUyNjA0NTAxN30=	2018-05-11 15:33:37.684312+02
vg74dyswkazh51gp7i582eo4ef73cics	YjdjNzA3Mjc3NWFlZTM1MjNkMDRiNmU0YWJkYTkxNjc5OGQ1NjQ1ODp7InN1cHBvcnRlZF9icm93c2VyIjp0cnVlLCJsYXN0X3Nlc3Npb25fcmVxdWVzdCI6MTUyNjA0NTAyOX0=	2018-05-11 15:33:49.568985+02
\.


--
-- Data for Name: exams_exam; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exams_exam (id, _morango_dirty_bit, _morango_source_id, _morango_partition, title, channel_id, question_count, question_sources, seed, active, archive, collection_id, creator_id, dataset_id) FROM stdin;
\.


--
-- Data for Name: exams_examassignment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exams_examassignment (id, _morango_dirty_bit, _morango_source_id, _morango_partition, assigned_by_id, collection_id, dataset_id, exam_id) FROM stdin;
\.


--
-- Data for Name: kolibriauth_collection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kolibriauth_collection (id, _morango_dirty_bit, _morango_source_id, _morango_partition, name, kind, lft, rght, tree_id, level, dataset_id, parent_id) FROM stdin;
887d4ac3-460b-5341-bffd-a1bd1c196310	t	784a9744588942ce8c0cac5fc836324e	90432154ac9a9bf0d7477dbc4b59152c:allusers-ro	Test Facility	facility	1	2	1	0	90432154-ac9a-9bf0-d747-7dbc4b59152c	\N
\.


--
-- Data for Name: kolibriauth_facilitydataset; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kolibriauth_facilitydataset (id, _morango_dirty_bit, _morango_source_id, _morango_partition, description, location, learner_can_edit_username, learner_can_edit_name, learner_can_edit_password, learner_can_sign_up, learner_can_delete_account, learner_can_login_with_no_password, preset, show_download_button_in_learn) FROM stdin;
90432154-ac9a-9bf0-d747-7dbc4b59152c	t	90432154ac9a9bf0d7477dbc4b59152c	90432154ac9a9bf0d7477dbc4b59152c:allusers-ro			f	f	f	f	f	t	nonformal	f
\.


--
-- Data for Name: kolibriauth_facilityuser; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kolibriauth_facilityuser (password, last_login, id, _morango_dirty_bit, _morango_source_id, _morango_partition, username, full_name, date_joined, dataset_id, facility_id) FROM stdin;
pbkdf2_sha256$36000$6hGxKXmN9nDu$WkNoYka6bz62B+4Lge2XrpnRquAjyNjhVvo/Isy84sk=	2018-05-11 15:23:36.609877+02	ca9e1e4c-417c-729d-2de8-d7dc3b7df5f0	t	135e8e3655d641c8876d7e2be1d8ff46	90432154ac9a9bf0d7477dbc4b59152c:user-ro:ca9e1e4c417c729d2de8d7dc3b7df5f0	admin	Admin	2018-05-11 13:23:36.375226(Europe/Paris)	90432154-ac9a-9bf0-d747-7dbc4b59152c	887d4ac3-460b-5341-bffd-a1bd1c196310
\.


--
-- Data for Name: kolibriauth_membership; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kolibriauth_membership (id, _morango_dirty_bit, _morango_source_id, _morango_partition, collection_id, dataset_id, user_id) FROM stdin;
\.


--
-- Data for Name: kolibriauth_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kolibriauth_role (id, _morango_dirty_bit, _morango_source_id, _morango_partition, kind, collection_id, dataset_id, user_id) FROM stdin;
22fd7907-76ce-8f36-7b3b-6153c84fd666	t	887d4ac3460b5341bffda1bd1c196310:admin	90432154ac9a9bf0d7477dbc4b59152c:user-ro:ca9e1e4c417c729d2de8d7dc3b7df5f0	admin	887d4ac3-460b-5341-bffd-a1bd1c196310	90432154-ac9a-9bf0-d747-7dbc4b59152c	ca9e1e4c-417c-729d-2de8-d7dc3b7df5f0
\.


--
-- Data for Name: lessons_lesson; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lessons_lesson (id, _morango_dirty_bit, _morango_source_id, _morango_partition, title, description, resources, is_active, collection_id, created_by_id, dataset_id, date_created) FROM stdin;
\.


--
-- Data for Name: lessons_lessonassignment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lessons_lessonassignment (id, _morango_dirty_bit, _morango_source_id, _morango_partition, assigned_by_id, collection_id, dataset_id, lesson_id) FROM stdin;
\.


--
-- Data for Name: logger_attemptlog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logger_attemptlog (id, _morango_dirty_bit, _morango_source_id, _morango_partition, item, start_timestamp, end_timestamp, completion_timestamp, time_spent, complete, correct, hinted, answer, simple_answer, interaction_history, dataset_id, masterylog_id, sessionlog_id, user_id) FROM stdin;
\.


--
-- Data for Name: logger_contentsessionlog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logger_contentsessionlog (id, _morango_dirty_bit, _morango_source_id, _morango_partition, content_id, channel_id, start_timestamp, end_timestamp, time_spent, progress, kind, extra_fields, dataset_id, user_id) FROM stdin;
\.


--
-- Data for Name: logger_contentsummarylog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logger_contentsummarylog (id, _morango_dirty_bit, _morango_source_id, _morango_partition, content_id, channel_id, start_timestamp, end_timestamp, completion_timestamp, time_spent, progress, kind, extra_fields, dataset_id, user_id) FROM stdin;
\.


--
-- Data for Name: logger_examattemptlog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logger_examattemptlog (id, _morango_dirty_bit, _morango_source_id, _morango_partition, item, start_timestamp, end_timestamp, completion_timestamp, time_spent, complete, correct, hinted, answer, simple_answer, interaction_history, content_id, channel_id, dataset_id, examlog_id, user_id) FROM stdin;
\.


--
-- Data for Name: logger_examlog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logger_examlog (id, _morango_dirty_bit, _morango_source_id, _morango_partition, closed, completion_timestamp, dataset_id, exam_id, user_id) FROM stdin;
\.


--
-- Data for Name: logger_masterylog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logger_masterylog (id, _morango_dirty_bit, _morango_source_id, _morango_partition, mastery_criterion, start_timestamp, end_timestamp, completion_timestamp, mastery_level, complete, dataset_id, summarylog_id, user_id) FROM stdin;
\.


--
-- Data for Name: logger_usersessionlog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logger_usersessionlog (id, _morango_dirty_bit, _morango_source_id, _morango_partition, channels, start_timestamp, last_interaction_timestamp, pages, dataset_id, user_id) FROM stdin;
596c5c03-ca3a-278c-53af-789b03eb1b97	t	56f21180d7314f9f9831c970deaffc9c	90432154ac9a9bf0d7477dbc4b59152c:user-rw:ca9e1e4c417c729d2de8d7dc3b7df5f0		2018-05-11 13:23:36.639299(Europe/Paris)	2018-05-11 13:23:36.776358(Europe/Paris)		90432154-ac9a-9bf0-d747-7dbc4b59152c	ca9e1e4c-417c-729d-2de8-d7dc3b7df5f0
\.


--
-- Data for Name: morango_buffer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.morango_buffer (id, serialized, deleted, last_saved_instance, last_saved_counter, model_name, profile, partition, model_uuid, transfer_session_id, conflicting_serialized_data, _self_ref_fk, source_id) FROM stdin;
\.


--
-- Name: morango_buffer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.morango_buffer_id_seq', 1, false);


--
-- Data for Name: morango_certificate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.morango_certificate (id, profile, scope_version, scope_params, public_key, serialized, signature, private_key, lft, rght, tree_id, level, parent_id, scope_definition_id, salt) FROM stdin;
90432154-ac9a-9bf0-d747-7dbc4b59152c	facilitydata	1	{"dataset_id": "90432154ac9a9bf0d7477dbc4b59152c"}	MIIBCgKCAQEAxDRsafTLqnnV+gKeY0z/OQGdLs4YBOGlYei9UqCxfZ0zbP7/00H4WNkDslv2SM9KO1XeuGMzctP0IvUD4fbKSxbjVfZ0ZKvsytfecaJUxSmNazSw6ARyTSz/nEYz5kzkg40xu/QFXHjfdU/qV2hd9lcU8Ywxn+F6KeoiMt2yO3nfwYQLAu7OrZ/v/77mPg69YtwhE6JvXO/GNntVCAmMJsbxffxhBxOAe8PpQRZw+AeHjhRR+tCLGfyxqlTnk+x0MqYcIQ04Yuczu0dC7yGh4siCgJs2IAmwffm6gIEHJg1ZUV/k3n/UKLXYvBXMomtZ7k3a3jhamlcTcXlMpEsUgwIDAQAB	{"profile": "facilitydata", "parent_id": null, "scope_version": 1, "scope_params": "{\\"dataset_id\\": \\"90432154ac9a9bf0d7477dbc4b59152c\\"}", "public_key_string": "MIIBCgKCAQEAxDRsafTLqnnV+gKeY0z/OQGdLs4YBOGlYei9UqCxfZ0zbP7/00H4WNkDslv2SM9KO1XeuGMzctP0IvUD4fbKSxbjVfZ0ZKvsytfecaJUxSmNazSw6ARyTSz/nEYz5kzkg40xu/QFXHjfdU/qV2hd9lcU8Ywxn+F6KeoiMt2yO3nfwYQLAu7OrZ/v/77mPg69YtwhE6JvXO/GNntVCAmMJsbxffxhBxOAe8PpQRZw+AeHjhRR+tCLGfyxqlTnk+x0MqYcIQ04Yuczu0dC7yGh4siCgJs2IAmwffm6gIEHJg1ZUV/k3n/UKLXYvBXMomtZ7k3a3jhamlcTcXlMpEsUgwIDAQAB", "salt": "", "id": "90432154ac9a9bf0d7477dbc4b59152c", "scope_definition_id": "full-facility"}	sjRLT73R5DmjObp5mXuWpxtEXXo97x/2zj8oj7/k8yTM07ZqZXC2B1ecHjpB0m9ShBTB8oiPCkT3gG9u45A92HfX1tCKWXxbhSsFFiXumn72ehMMVvwu5xvgghFGESvE20Ne+b8BZPJCgqK0g4MZSgpVtmd6Nv5inZZh30ODm5V8otYcMgmQhiLYC7CQuOFbd88877mcXjJnzNv+BuSK0WZx/tkKgAO6wjoVzmXBdMwDWsUBNZcxJSzh//wzqIEQfYxKH86hy37pzh/vg4Ourp6TlYn+rAWeptQbVEN1lXkc8mZlaA9KnllJni+kMH2Bc3M3CWW+FGuOGskU1evakw==	-----BEGIN RSA PRIVATE KEY-----\nMIIEpgIBAAKCAQEAxDRsafTLqnnV+gKeY0z/OQGdLs4YBOGlYei9UqCxfZ0zbP7/\n00H4WNkDslv2SM9KO1XeuGMzctP0IvUD4fbKSxbjVfZ0ZKvsytfecaJUxSmNazSw\n6ARyTSz/nEYz5kzkg40xu/QFXHjfdU/qV2hd9lcU8Ywxn+F6KeoiMt2yO3nfwYQL\nAu7OrZ/v/77mPg69YtwhE6JvXO/GNntVCAmMJsbxffxhBxOAe8PpQRZw+AeHjhRR\n+tCLGfyxqlTnk+x0MqYcIQ04Yuczu0dC7yGh4siCgJs2IAmwffm6gIEHJg1ZUV/k\n3n/UKLXYvBXMomtZ7k3a3jhamlcTcXlMpEsUgwIDAQABAoIBAQCfJobqS48I8VsI\nOSeRFNvRueVuGe6RxxcHnGo1o/NVGTalqxKIonJ4X1AIVWApHzvvdW/70TviYNsf\nn+9OU4kz75ToHcm7/1lMEF53fl2UsGfuFgeJrFGrGF0evjNLFAQoUVeORhozMDjS\nR8imrhnJwElUxYtbTOJzLWAgMoRoiL/GbN92A/NUb9oWPVlDTSrcaFXp2ikOd4vh\nhKWArcW0yQNl1EGWqpAV9yi5wCKp+zz6Tf2J1uLbhNdU9MTOfsHqat/7BO7pZ5CS\nXktmD5Et3KlsLAMgFVCzR/f19L7CjBq/vdSj0FKZ61BwVbGAi+CfNv+9J2y0viRm\njgukdQMBAoGBAOHIqCeT7KFAzCj5s/Gm6jvzzraAD+lT+rxox1M6UTqYJRPpyW7U\nkWfx71JWmS2JLMQ4b1fxqSCyeycin8A+VsL+Wx4yX3Zgml4r4XFnIS/ynEBtpEk9\n1U+9mYTepltcjMxJ06TksMoMvxiL/2GTcIiakp3gqMi3MvO2MmFNnL7xAoGBAN52\nY+R/mLBe08jX7kuJ5cHDaD9hEMG1H5jrZ07d7F+43LFRquqYAIqlw8yACj6Rk2ta\n1L+rv1/9rcEclnqmC/ZtrCQVGm2btwALTN1qIWNFv22GyJ8U3PXhMjHd5G8JST3h\nU/tknYDy3hVPnDUX2mmQVVgXm56KwCVBrgCNzrKzAoGBANx2CXtbvRpXIwJ/j2zO\nBrkzfwxET0UNcy61QKvLrbUBCnM/PCiz9qcAXSaQ2FDWOJgAYvgER5hdrlKwRDx6\nok0T//SkSwJToWeCgUcx4/3lbxyZ8mhxr++Euno6zUU4QWLYU4gWpWkkuRNG375v\nMNqx06fEzgnumBnQNbE9D2iBAoGBANPHtTU0W3Gb9NZA6nQzJO0fT8D2cPNXsGrt\nv32PO5Ws8TxFWQbYCbv0LsAiLJ6AC+2pnNuTby6824r54i+En+LLaZM4G9643LBI\nEba/cGWHYsOsCpWXUPsqlZRvfyZNmtI0DrVGhcLacp2rGjRZLu5MH1MrtlRqFp3h\nNvsEBQCNAoGBAK14e5ChmwFWyKQxA5tMqqnzcEIDvbIR0fmJ43DoZU7mBLe3VN+x\nVaKL8lDfC7OqSj6h7SG846ctmPb4Z2JpcmU2foYTqbFKoRc3W/th36yyY6thnbHm\nddM4+ihTzUlvcHr7+ngN+7niRB6FskWUsGWMgzu6tw9FyXcqww5IjWsQ\n-----END RSA PRIVATE KEY-----\n	1	2	1	0	\N	full-facility	
\.


--
-- Data for Name: morango_databaseidmodel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.morango_databaseidmodel (id, current, date_generated, initial_instance_id) FROM stdin;
085c9821-e935-4f6c-915d-f785c86d5b0f	t	2018-05-11 15:22:59.415859+02	
\.


--
-- Data for Name: morango_databasemaxcounter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.morango_databasemaxcounter (id, instance_id, counter, partition) FROM stdin;
\.


--
-- Name: morango_databasemaxcounter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.morango_databasemaxcounter_id_seq', 1, false);


--
-- Data for Name: morango_deletedmodels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.morango_deletedmodels (id, profile) FROM stdin;
\.


--
-- Data for Name: morango_instanceidmodel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.morango_instanceidmodel (id, platform, hostname, sysversion, node_id, counter, current, db_path, database_id, system_id) FROM stdin;
a67c93b8-3090-a0cc-ae3c-2e56a6d95469	Linux-4.14.0-041400-generic-x86_64-with-Ubuntu-17.10-artful	t470s	2.7.14 (default, Sep 23 2017, 22:06:14) \n[GCC 7.2.0]	1818e04e5948d1664ee0	0	t	/home/boni/projects/learning-equality/kolibri/velox	085c9821-e935-4f6c-915d-f785c86d5b0f	
\.


--
-- Data for Name: morango_nonce; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.morango_nonce (id, "timestamp", ip) FROM stdin;
\.


--
-- Data for Name: morango_recordmaxcounter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.morango_recordmaxcounter (id, instance_id, counter, store_model_id) FROM stdin;
\.


--
-- Name: morango_recordmaxcounter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.morango_recordmaxcounter_id_seq', 1, false);


--
-- Data for Name: morango_recordmaxcounterbuffer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.morango_recordmaxcounterbuffer (id, instance_id, counter, model_uuid, transfer_session_id) FROM stdin;
\.


--
-- Name: morango_recordmaxcounterbuffer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.morango_recordmaxcounterbuffer_id_seq', 1, false);


--
-- Data for Name: morango_scopedefinition; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.morango_scopedefinition (profile, version, id, description, read_filter_template, write_filter_template, read_write_filter_template, primary_scope_param_key) FROM stdin;
facilitydata	1	full-facility	Allows full syncing for data under the Facility with FacilityDataset ID ${dataset_id}.			${dataset_id}	dataset_id
facilitydata	1	single-user	Allows syncing data for FacilityUser ${user_id} under Facility with FacilityDataset ID ${dataset_id}.	${dataset_id}:allusers-ro\n${dataset_id}:user-ro:${user_id}	${dataset_id}:anonymous	${dataset_id}:user-rw:${user_id}	
\.


--
-- Data for Name: morango_store; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.morango_store (serialized, deleted, last_saved_instance, last_saved_counter, model_name, profile, partition, id, conflicting_serialized_data, _self_ref_fk, dirty_bit, source_id) FROM stdin;
\.


--
-- Data for Name: morango_syncsession; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.morango_syncsession (id, start_timestamp, last_activity_timestamp, active, connection_kind, connection_path, is_server, client_instance, client_ip, profile, server_instance, server_ip, client_certificate_id, server_certificate_id) FROM stdin;
\.


--
-- Data for Name: morango_transfersession; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.morango_transfersession (id, filter, push, active, records_total, sync_session_id, last_activity_timestamp, client_fsic, records_transferred, server_fsic, start_timestamp) FROM stdin;
\.


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: content_assessmentmetadata content_assessmentmetadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_assessmentmetadata
    ADD CONSTRAINT content_assessmentmetadata_pkey PRIMARY KEY (id);


--
-- Name: content_channelmetadata content_channelmetadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_channelmetadata
    ADD CONSTRAINT content_channelmetadata_pkey PRIMARY KEY (id);


--
-- Name: content_contentnode_has_prerequisite content_contentnode_has__from_contentnode_id_to_c_c9e1d527_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_contentnode_has_prerequisite
    ADD CONSTRAINT content_contentnode_has__from_contentnode_id_to_c_c9e1d527_uniq UNIQUE (from_contentnode_id, to_contentnode_id);


--
-- Name: content_contentnode_has_prerequisite content_contentnode_has_prerequisite_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_contentnode_has_prerequisite
    ADD CONSTRAINT content_contentnode_has_prerequisite_pkey PRIMARY KEY (id);


--
-- Name: content_contentnode content_contentnode_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_contentnode
    ADD CONSTRAINT content_contentnode_pkey PRIMARY KEY (id);


--
-- Name: content_contentnode_related content_contentnode_rela_from_contentnode_id_to_c_fc2ed20c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_contentnode_related
    ADD CONSTRAINT content_contentnode_rela_from_contentnode_id_to_c_fc2ed20c_uniq UNIQUE (from_contentnode_id, to_contentnode_id);


--
-- Name: content_contentnode_related content_contentnode_related_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_contentnode_related
    ADD CONSTRAINT content_contentnode_related_pkey PRIMARY KEY (id);


--
-- Name: content_contentnode_tags content_contentnode_tags_contentnode_id_contentta_64a4ac15_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_contentnode_tags
    ADD CONSTRAINT content_contentnode_tags_contentnode_id_contentta_64a4ac15_uniq UNIQUE (contentnode_id, contenttag_id);


--
-- Name: content_contentnode_tags content_contentnode_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_contentnode_tags
    ADD CONSTRAINT content_contentnode_tags_pkey PRIMARY KEY (id);


--
-- Name: content_contenttag content_contenttag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_contenttag
    ADD CONSTRAINT content_contenttag_pkey PRIMARY KEY (id);


--
-- Name: content_file content_file_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_file
    ADD CONSTRAINT content_file_pkey PRIMARY KEY (id);


--
-- Name: content_language content_language_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_language
    ADD CONSTRAINT content_language_pkey PRIMARY KEY (id);


--
-- Name: content_localfile content_localfile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_localfile
    ADD CONSTRAINT content_localfile_pkey PRIMARY KEY (id);


--
-- Name: device_devicepermissions device_devicepermissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_devicepermissions
    ADD CONSTRAINT device_devicepermissions_pkey PRIMARY KEY (user_id);


--
-- Name: device_devicesettings device_devicesettings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_devicesettings
    ADD CONSTRAINT device_devicesettings_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: exams_exam exams_exam_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exams_exam
    ADD CONSTRAINT exams_exam_pkey PRIMARY KEY (id);


--
-- Name: exams_examassignment exams_examassignment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exams_examassignment
    ADD CONSTRAINT exams_examassignment_pkey PRIMARY KEY (id);


--
-- Name: kolibriauth_collection kolibriauth_collection_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kolibriauth_collection
    ADD CONSTRAINT kolibriauth_collection_pkey PRIMARY KEY (id);


--
-- Name: kolibriauth_facilitydataset kolibriauth_facilitydataset_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kolibriauth_facilitydataset
    ADD CONSTRAINT kolibriauth_facilitydataset_pkey PRIMARY KEY (id);


--
-- Name: kolibriauth_facilityuser kolibriauth_facilityuser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kolibriauth_facilityuser
    ADD CONSTRAINT kolibriauth_facilityuser_pkey PRIMARY KEY (id);


--
-- Name: kolibriauth_membership kolibriauth_membership_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kolibriauth_membership
    ADD CONSTRAINT kolibriauth_membership_pkey PRIMARY KEY (id);


--
-- Name: kolibriauth_membership kolibriauth_membership_user_id_collection_id_48b95423_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kolibriauth_membership
    ADD CONSTRAINT kolibriauth_membership_user_id_collection_id_48b95423_uniq UNIQUE (user_id, collection_id);


--
-- Name: kolibriauth_role kolibriauth_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kolibriauth_role
    ADD CONSTRAINT kolibriauth_role_pkey PRIMARY KEY (id);


--
-- Name: kolibriauth_role kolibriauth_role_user_id_collection_id_kind_9c51e8a2_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kolibriauth_role
    ADD CONSTRAINT kolibriauth_role_user_id_collection_id_kind_9c51e8a2_uniq UNIQUE (user_id, collection_id, kind);


--
-- Name: lessons_lesson lessons_lesson_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons_lesson
    ADD CONSTRAINT lessons_lesson_pkey PRIMARY KEY (id);


--
-- Name: lessons_lessonassignment lessons_lessonassignment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons_lessonassignment
    ADD CONSTRAINT lessons_lessonassignment_pkey PRIMARY KEY (id);


--
-- Name: logger_attemptlog logger_attemptlog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logger_attemptlog
    ADD CONSTRAINT logger_attemptlog_pkey PRIMARY KEY (id);


--
-- Name: logger_contentsessionlog logger_contentsessionlog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logger_contentsessionlog
    ADD CONSTRAINT logger_contentsessionlog_pkey PRIMARY KEY (id);


--
-- Name: logger_contentsummarylog logger_contentsummarylog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logger_contentsummarylog
    ADD CONSTRAINT logger_contentsummarylog_pkey PRIMARY KEY (id);


--
-- Name: logger_examattemptlog logger_examattemptlog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logger_examattemptlog
    ADD CONSTRAINT logger_examattemptlog_pkey PRIMARY KEY (id);


--
-- Name: logger_examlog logger_examlog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logger_examlog
    ADD CONSTRAINT logger_examlog_pkey PRIMARY KEY (id);


--
-- Name: logger_masterylog logger_masterylog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logger_masterylog
    ADD CONSTRAINT logger_masterylog_pkey PRIMARY KEY (id);


--
-- Name: logger_usersessionlog logger_usersessionlog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logger_usersessionlog
    ADD CONSTRAINT logger_usersessionlog_pkey PRIMARY KEY (id);


--
-- Name: morango_buffer morango_buffer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.morango_buffer
    ADD CONSTRAINT morango_buffer_pkey PRIMARY KEY (id);


--
-- Name: morango_buffer morango_buffer_transfer_session_id_model_uuid_2a7288db_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.morango_buffer
    ADD CONSTRAINT morango_buffer_transfer_session_id_model_uuid_2a7288db_uniq UNIQUE (transfer_session_id, model_uuid);


--
-- Name: morango_certificate morango_certificate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.morango_certificate
    ADD CONSTRAINT morango_certificate_pkey PRIMARY KEY (id);


--
-- Name: morango_databaseidmodel morango_databaseidmodel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.morango_databaseidmodel
    ADD CONSTRAINT morango_databaseidmodel_pkey PRIMARY KEY (id);


--
-- Name: morango_databasemaxcounter morango_databasemaxcounter_instance_id_partition_99e4f1fb_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.morango_databasemaxcounter
    ADD CONSTRAINT morango_databasemaxcounter_instance_id_partition_99e4f1fb_uniq UNIQUE (instance_id, partition);


--
-- Name: morango_databasemaxcounter morango_databasemaxcounter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.morango_databasemaxcounter
    ADD CONSTRAINT morango_databasemaxcounter_pkey PRIMARY KEY (id);


--
-- Name: morango_deletedmodels morango_deletedmodels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.morango_deletedmodels
    ADD CONSTRAINT morango_deletedmodels_pkey PRIMARY KEY (id);


--
-- Name: morango_instanceidmodel morango_instanceidmodel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.morango_instanceidmodel
    ADD CONSTRAINT morango_instanceidmodel_pkey PRIMARY KEY (id);


--
-- Name: morango_nonce morango_nonce_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.morango_nonce
    ADD CONSTRAINT morango_nonce_pkey PRIMARY KEY (id);


--
-- Name: morango_recordmaxcounter morango_recordmaxcounter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.morango_recordmaxcounter
    ADD CONSTRAINT morango_recordmaxcounter_pkey PRIMARY KEY (id);


--
-- Name: morango_recordmaxcounter morango_recordmaxcounter_store_model_id_instance__d478818f_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.morango_recordmaxcounter
    ADD CONSTRAINT morango_recordmaxcounter_store_model_id_instance__d478818f_uniq UNIQUE (store_model_id, instance_id);


--
-- Name: morango_recordmaxcounterbuffer morango_recordmaxcounterbuffer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.morango_recordmaxcounterbuffer
    ADD CONSTRAINT morango_recordmaxcounterbuffer_pkey PRIMARY KEY (id);


--
-- Name: morango_scopedefinition morango_scopedefinition_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.morango_scopedefinition
    ADD CONSTRAINT morango_scopedefinition_pkey PRIMARY KEY (id);


--
-- Name: morango_store morango_store_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.morango_store
    ADD CONSTRAINT morango_store_pkey PRIMARY KEY (id);


--
-- Name: morango_syncsession morango_syncsession_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.morango_syncsession
    ADD CONSTRAINT morango_syncsession_pkey PRIMARY KEY (id);


--
-- Name: morango_transfersession morango_transfersession_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.morango_transfersession
    ADD CONSTRAINT morango_transfersession_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: content_assessmentmetadata_contentnode_id_19cbc70a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX content_assessmentmetadata_contentnode_id_19cbc70a ON public.content_assessmentmetadata USING btree (contentnode_id);


--
-- Name: content_channelmetadata_root_id_ba963469; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX content_channelmetadata_root_id_ba963469 ON public.content_channelmetadata USING btree (root_id);


--
-- Name: content_contentnode_channel_id_77d3faec; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX content_contentnode_channel_id_77d3faec ON public.content_contentnode USING btree (channel_id);


--
-- Name: content_contentnode_content_id_790eac82; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX content_contentnode_content_id_790eac82 ON public.content_contentnode USING btree (content_id);


--
-- Name: content_contentnode_has_pr_from_contentnode_id_1085c145; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX content_contentnode_has_pr_from_contentnode_id_1085c145 ON public.content_contentnode_has_prerequisite USING btree (from_contentnode_id);


--
-- Name: content_contentnode_has_prerequisite_to_contentnode_id_5561f92c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX content_contentnode_has_prerequisite_to_contentnode_id_5561f92c ON public.content_contentnode_has_prerequisite USING btree (to_contentnode_id);


--
-- Name: content_contentnode_lang_id_600d594b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX content_contentnode_lang_id_600d594b ON public.content_contentnode USING btree (lang_id);


--
-- Name: content_contentnode_lang_id_600d594b_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX content_contentnode_lang_id_600d594b_like ON public.content_contentnode USING btree (lang_id varchar_pattern_ops);


--
-- Name: content_contentnode_level_9ffc3b01; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX content_contentnode_level_9ffc3b01 ON public.content_contentnode USING btree (level);


--
-- Name: content_contentnode_level_channel_id_available_29f0bb18_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX content_contentnode_level_channel_id_available_29f0bb18_idx ON public.content_contentnode USING btree (level, channel_id, available);


--
-- Name: content_contentnode_level_channel_id_kind_fd732cc4_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX content_contentnode_level_channel_id_kind_fd732cc4_idx ON public.content_contentnode USING btree (level, channel_id, kind);


--
-- Name: content_contentnode_lft_4253d420; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX content_contentnode_lft_4253d420 ON public.content_contentnode USING btree (lft);


--
-- Name: content_contentnode_parent_id_47178783; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX content_contentnode_parent_id_47178783 ON public.content_contentnode USING btree (parent_id);


--
-- Name: content_contentnode_related_from_contentnode_id_f56e3999; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX content_contentnode_related_from_contentnode_id_f56e3999 ON public.content_contentnode_related USING btree (from_contentnode_id);


--
-- Name: content_contentnode_related_to_contentnode_id_42e82421; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX content_contentnode_related_to_contentnode_id_42e82421 ON public.content_contentnode_related USING btree (to_contentnode_id);


--
-- Name: content_contentnode_rght_33f2973d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX content_contentnode_rght_33f2973d ON public.content_contentnode USING btree (rght);


--
-- Name: content_contentnode_tags_contentnode_id_4ea196dd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX content_contentnode_tags_contentnode_id_4ea196dd ON public.content_contentnode_tags USING btree (contentnode_id);


--
-- Name: content_contentnode_tags_contenttag_id_9518e093; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX content_contentnode_tags_contenttag_id_9518e093 ON public.content_contentnode_tags USING btree (contenttag_id);


--
-- Name: content_contentnode_tree_id_d115ca94; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX content_contentnode_tree_id_d115ca94 ON public.content_contentnode USING btree (tree_id);


--
-- Name: content_file_contentnode_id_d4089e6e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX content_file_contentnode_id_d4089e6e ON public.content_file USING btree (contentnode_id);


--
-- Name: content_file_lang_id_364540cd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX content_file_lang_id_364540cd ON public.content_file USING btree (lang_id);


--
-- Name: content_file_lang_id_364540cd_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX content_file_lang_id_364540cd_like ON public.content_file USING btree (lang_id varchar_pattern_ops);


--
-- Name: content_file_local_file_id_9780c2ab; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX content_file_local_file_id_9780c2ab ON public.content_file USING btree (local_file_id);


--
-- Name: content_file_local_file_id_9780c2ab_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX content_file_local_file_id_9780c2ab_like ON public.content_file USING btree (local_file_id varchar_pattern_ops);


--
-- Name: content_file_priority_073dafe4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX content_file_priority_073dafe4 ON public.content_file USING btree (priority);


--
-- Name: content_language_id_e9f35e8f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX content_language_id_e9f35e8f_like ON public.content_language USING btree (id varchar_pattern_ops);


--
-- Name: content_language_lang_code_7a423afe; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX content_language_lang_code_7a423afe ON public.content_language USING btree (lang_code);


--
-- Name: content_language_lang_code_7a423afe_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX content_language_lang_code_7a423afe_like ON public.content_language USING btree (lang_code varchar_pattern_ops);


--
-- Name: content_language_lang_subcode_6ca3c58e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX content_language_lang_subcode_6ca3c58e ON public.content_language USING btree (lang_subcode);


--
-- Name: content_language_lang_subcode_6ca3c58e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX content_language_lang_subcode_6ca3c58e_like ON public.content_language USING btree (lang_subcode varchar_pattern_ops);


--
-- Name: content_localfile_id_a2a9e67d_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX content_localfile_id_a2a9e67d_like ON public.content_localfile USING btree (id varchar_pattern_ops);


--
-- Name: device_devicesettings_default_facility_id_8937e0b7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX device_devicesettings_default_facility_id_8937e0b7 ON public.device_devicesettings USING btree (default_facility_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: exams_exam_collection_id_9dc0b187; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX exams_exam_collection_id_9dc0b187 ON public.exams_exam USING btree (collection_id);


--
-- Name: exams_exam_creator_id_37d1b2e5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX exams_exam_creator_id_37d1b2e5 ON public.exams_exam USING btree (creator_id);


--
-- Name: exams_exam_dataset_id_7dff1bad; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX exams_exam_dataset_id_7dff1bad ON public.exams_exam USING btree (dataset_id);


--
-- Name: exams_examassignment_assigned_by_id_53aa193a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX exams_examassignment_assigned_by_id_53aa193a ON public.exams_examassignment USING btree (assigned_by_id);


--
-- Name: exams_examassignment_collection_id_90ec6a7a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX exams_examassignment_collection_id_90ec6a7a ON public.exams_examassignment USING btree (collection_id);


--
-- Name: exams_examassignment_dataset_id_3200aa09; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX exams_examassignment_dataset_id_3200aa09 ON public.exams_examassignment USING btree (dataset_id);


--
-- Name: exams_examassignment_exam_id_d7c499da; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX exams_examassignment_exam_id_d7c499da ON public.exams_examassignment USING btree (exam_id);


--
-- Name: kolibriauth_collection_dataset_id_5689c7d8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX kolibriauth_collection_dataset_id_5689c7d8 ON public.kolibriauth_collection USING btree (dataset_id);


--
-- Name: kolibriauth_collection_level_4af376dc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX kolibriauth_collection_level_4af376dc ON public.kolibriauth_collection USING btree (level);


--
-- Name: kolibriauth_collection_lft_ee90bb3a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX kolibriauth_collection_lft_ee90bb3a ON public.kolibriauth_collection USING btree (lft);


--
-- Name: kolibriauth_collection_parent_id_1561ec4a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX kolibriauth_collection_parent_id_1561ec4a ON public.kolibriauth_collection USING btree (parent_id);


--
-- Name: kolibriauth_collection_rght_54dc9abb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX kolibriauth_collection_rght_54dc9abb ON public.kolibriauth_collection USING btree (rght);


--
-- Name: kolibriauth_collection_tree_id_07cebdf6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX kolibriauth_collection_tree_id_07cebdf6 ON public.kolibriauth_collection USING btree (tree_id);


--
-- Name: kolibriauth_facilityuser_dataset_id_0dab63f9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX kolibriauth_facilityuser_dataset_id_0dab63f9 ON public.kolibriauth_facilityuser USING btree (dataset_id);


--
-- Name: kolibriauth_facilityuser_facility_id_f602d621; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX kolibriauth_facilityuser_facility_id_f602d621 ON public.kolibriauth_facilityuser USING btree (facility_id);


--
-- Name: kolibriauth_membership_collection_id_c955dbd2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX kolibriauth_membership_collection_id_c955dbd2 ON public.kolibriauth_membership USING btree (collection_id);


--
-- Name: kolibriauth_membership_dataset_id_13e29803; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX kolibriauth_membership_dataset_id_13e29803 ON public.kolibriauth_membership USING btree (dataset_id);


--
-- Name: kolibriauth_membership_user_id_79317fa1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX kolibriauth_membership_user_id_79317fa1 ON public.kolibriauth_membership USING btree (user_id);


--
-- Name: kolibriauth_role_collection_id_1fa9ce6f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX kolibriauth_role_collection_id_1fa9ce6f ON public.kolibriauth_role USING btree (collection_id);


--
-- Name: kolibriauth_role_dataset_id_70eb0469; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX kolibriauth_role_dataset_id_70eb0469 ON public.kolibriauth_role USING btree (dataset_id);


--
-- Name: kolibriauth_role_user_id_d4014967; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX kolibriauth_role_user_id_d4014967 ON public.kolibriauth_role USING btree (user_id);


--
-- Name: lessons_lesson_collection_id_13b7d040; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX lessons_lesson_collection_id_13b7d040 ON public.lessons_lesson USING btree (collection_id);


--
-- Name: lessons_lesson_created_by_id_441dbacf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX lessons_lesson_created_by_id_441dbacf ON public.lessons_lesson USING btree (created_by_id);


--
-- Name: lessons_lesson_dataset_id_da71bead; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX lessons_lesson_dataset_id_da71bead ON public.lessons_lesson USING btree (dataset_id);


--
-- Name: lessons_lessonassignment_assigned_by_id_ed8b2358; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX lessons_lessonassignment_assigned_by_id_ed8b2358 ON public.lessons_lessonassignment USING btree (assigned_by_id);


--
-- Name: lessons_lessonassignment_collection_id_d30ca20a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX lessons_lessonassignment_collection_id_d30ca20a ON public.lessons_lessonassignment USING btree (collection_id);


--
-- Name: lessons_lessonassignment_dataset_id_07c252d8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX lessons_lessonassignment_dataset_id_07c252d8 ON public.lessons_lessonassignment USING btree (dataset_id);


--
-- Name: lessons_lessonassignment_lesson_id_52b19e73; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX lessons_lessonassignment_lesson_id_52b19e73 ON public.lessons_lessonassignment USING btree (lesson_id);


--
-- Name: logger_attemptlog_dataset_id_3017c88e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logger_attemptlog_dataset_id_3017c88e ON public.logger_attemptlog USING btree (dataset_id);


--
-- Name: logger_attemptlog_masterylog_id_d65af27c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logger_attemptlog_masterylog_id_d65af27c ON public.logger_attemptlog USING btree (masterylog_id);


--
-- Name: logger_attemptlog_sessionlog_id_0a239a1a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logger_attemptlog_sessionlog_id_0a239a1a ON public.logger_attemptlog USING btree (sessionlog_id);


--
-- Name: logger_attemptlog_user_id_cd57843f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logger_attemptlog_user_id_cd57843f ON public.logger_attemptlog USING btree (user_id);


--
-- Name: logger_contentsessionlog_content_id_12ef7b71; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logger_contentsessionlog_content_id_12ef7b71 ON public.logger_contentsessionlog USING btree (content_id);


--
-- Name: logger_contentsessionlog_dataset_id_9b53cdba; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logger_contentsessionlog_dataset_id_9b53cdba ON public.logger_contentsessionlog USING btree (dataset_id);


--
-- Name: logger_contentsessionlog_user_id_173ee284; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logger_contentsessionlog_user_id_173ee284 ON public.logger_contentsessionlog USING btree (user_id);


--
-- Name: logger_contentsummarylog_content_id_2e21d8cf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logger_contentsummarylog_content_id_2e21d8cf ON public.logger_contentsummarylog USING btree (content_id);


--
-- Name: logger_contentsummarylog_dataset_id_f9a1ad8e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logger_contentsummarylog_dataset_id_f9a1ad8e ON public.logger_contentsummarylog USING btree (dataset_id);


--
-- Name: logger_contentsummarylog_user_id_16aa2b2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logger_contentsummarylog_user_id_16aa2b2c ON public.logger_contentsummarylog USING btree (user_id);


--
-- Name: logger_examattemptlog_dataset_id_9f9d1b24; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logger_examattemptlog_dataset_id_9f9d1b24 ON public.logger_examattemptlog USING btree (dataset_id);


--
-- Name: logger_examattemptlog_examlog_id_ad0f674d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logger_examattemptlog_examlog_id_ad0f674d ON public.logger_examattemptlog USING btree (examlog_id);


--
-- Name: logger_examattemptlog_user_id_5442dc41; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logger_examattemptlog_user_id_5442dc41 ON public.logger_examattemptlog USING btree (user_id);


--
-- Name: logger_examlog_dataset_id_13109aa7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logger_examlog_dataset_id_13109aa7 ON public.logger_examlog USING btree (dataset_id);


--
-- Name: logger_examlog_exam_id_41856b8c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logger_examlog_exam_id_41856b8c ON public.logger_examlog USING btree (exam_id);


--
-- Name: logger_examlog_user_id_05397f8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logger_examlog_user_id_05397f8b ON public.logger_examlog USING btree (user_id);


--
-- Name: logger_masterylog_dataset_id_f5b54331; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logger_masterylog_dataset_id_f5b54331 ON public.logger_masterylog USING btree (dataset_id);


--
-- Name: logger_masterylog_summarylog_id_f2816f59; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logger_masterylog_summarylog_id_f2816f59 ON public.logger_masterylog USING btree (summarylog_id);


--
-- Name: logger_masterylog_user_id_3f58a1cb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logger_masterylog_user_id_3f58a1cb ON public.logger_masterylog USING btree (user_id);


--
-- Name: logger_usersessionlog_dataset_id_1a2bbb5f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logger_usersessionlog_dataset_id_1a2bbb5f ON public.logger_usersessionlog USING btree (dataset_id);


--
-- Name: logger_usersessionlog_user_id_a755b0c2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logger_usersessionlog_user_id_a755b0c2 ON public.logger_usersessionlog USING btree (user_id);


--
-- Name: morango_buffer_transfer_session_id_8e70af5a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX morango_buffer_transfer_session_id_8e70af5a ON public.morango_buffer USING btree (transfer_session_id);


--
-- Name: morango_certificate_level_bb83c8bf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX morango_certificate_level_bb83c8bf ON public.morango_certificate USING btree (level);


--
-- Name: morango_certificate_lft_7686107b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX morango_certificate_lft_7686107b ON public.morango_certificate USING btree (lft);


--
-- Name: morango_certificate_parent_id_60dedc2b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX morango_certificate_parent_id_60dedc2b ON public.morango_certificate USING btree (parent_id);


--
-- Name: morango_certificate_rght_fc1fe114; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX morango_certificate_rght_fc1fe114 ON public.morango_certificate USING btree (rght);


--
-- Name: morango_certificate_scope_definition_id_1f75587b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX morango_certificate_scope_definition_id_1f75587b ON public.morango_certificate USING btree (scope_definition_id);


--
-- Name: morango_certificate_scope_definition_id_1f75587b_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX morango_certificate_scope_definition_id_1f75587b_like ON public.morango_certificate USING btree (scope_definition_id varchar_pattern_ops);


--
-- Name: morango_certificate_tree_id_88a9f83c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX morango_certificate_tree_id_88a9f83c ON public.morango_certificate USING btree (tree_id);


--
-- Name: morango_instanceidmodel_database_id_3d1b7c0a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX morango_instanceidmodel_database_id_3d1b7c0a ON public.morango_instanceidmodel USING btree (database_id);


--
-- Name: morango_recordmaxcounter_store_model_id_2a91327d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX morango_recordmaxcounter_store_model_id_2a91327d ON public.morango_recordmaxcounter USING btree (store_model_id);


--
-- Name: morango_recordmaxcounterbuffer_transfer_session_id_1e48e3dd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX morango_recordmaxcounterbuffer_transfer_session_id_1e48e3dd ON public.morango_recordmaxcounterbuffer USING btree (transfer_session_id);


--
-- Name: morango_scopedefinition_scope_id_827eada2_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX morango_scopedefinition_scope_id_827eada2_like ON public.morango_scopedefinition USING btree (id varchar_pattern_ops);


--
-- Name: morango_syncsession_client_certificate_id_507e0d5d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX morango_syncsession_client_certificate_id_507e0d5d ON public.morango_syncsession USING btree (client_certificate_id);


--
-- Name: morango_syncsession_server_certificate_id_52bf728f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX morango_syncsession_server_certificate_id_52bf728f ON public.morango_syncsession USING btree (server_certificate_id);


--
-- Name: morango_transfersession_sync_session_id_0455b5bd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX morango_transfersession_sync_session_id_0455b5bd ON public.morango_transfersession USING btree (sync_session_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_assessmentmetadata content_assessmentme_contentnode_id_19cbc70a_fk_content_c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_assessmentmetadata
    ADD CONSTRAINT content_assessmentme_contentnode_id_19cbc70a_fk_content_c FOREIGN KEY (contentnode_id) REFERENCES public.content_contentnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_channelmetadata content_channelmetad_root_id_ba963469_fk_content_c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_channelmetadata
    ADD CONSTRAINT content_channelmetad_root_id_ba963469_fk_content_c FOREIGN KEY (root_id) REFERENCES public.content_contentnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_contentnode_tags content_contentnode__contentnode_id_4ea196dd_fk_content_c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_contentnode_tags
    ADD CONSTRAINT content_contentnode__contentnode_id_4ea196dd_fk_content_c FOREIGN KEY (contentnode_id) REFERENCES public.content_contentnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_contentnode_tags content_contentnode__contenttag_id_9518e093_fk_content_c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_contentnode_tags
    ADD CONSTRAINT content_contentnode__contenttag_id_9518e093_fk_content_c FOREIGN KEY (contenttag_id) REFERENCES public.content_contenttag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_contentnode_has_prerequisite content_contentnode__from_contentnode_id_1085c145_fk_content_c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_contentnode_has_prerequisite
    ADD CONSTRAINT content_contentnode__from_contentnode_id_1085c145_fk_content_c FOREIGN KEY (from_contentnode_id) REFERENCES public.content_contentnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_contentnode_related content_contentnode__from_contentnode_id_f56e3999_fk_content_c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_contentnode_related
    ADD CONSTRAINT content_contentnode__from_contentnode_id_f56e3999_fk_content_c FOREIGN KEY (from_contentnode_id) REFERENCES public.content_contentnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_contentnode_related content_contentnode__to_contentnode_id_42e82421_fk_content_c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_contentnode_related
    ADD CONSTRAINT content_contentnode__to_contentnode_id_42e82421_fk_content_c FOREIGN KEY (to_contentnode_id) REFERENCES public.content_contentnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_contentnode_has_prerequisite content_contentnode__to_contentnode_id_5561f92c_fk_content_c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_contentnode_has_prerequisite
    ADD CONSTRAINT content_contentnode__to_contentnode_id_5561f92c_fk_content_c FOREIGN KEY (to_contentnode_id) REFERENCES public.content_contentnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_contentnode content_contentnode_lang_id_600d594b_fk_content_language_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_contentnode
    ADD CONSTRAINT content_contentnode_lang_id_600d594b_fk_content_language_id FOREIGN KEY (lang_id) REFERENCES public.content_language(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_contentnode content_contentnode_parent_id_47178783_fk_content_c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_contentnode
    ADD CONSTRAINT content_contentnode_parent_id_47178783_fk_content_c FOREIGN KEY (parent_id) REFERENCES public.content_contentnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_file content_file_contentnode_id_d4089e6e_fk_content_contentnode_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_file
    ADD CONSTRAINT content_file_contentnode_id_d4089e6e_fk_content_contentnode_id FOREIGN KEY (contentnode_id) REFERENCES public.content_contentnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_file content_file_lang_id_364540cd_fk_content_language_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_file
    ADD CONSTRAINT content_file_lang_id_364540cd_fk_content_language_id FOREIGN KEY (lang_id) REFERENCES public.content_language(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_file content_file_local_file_id_9780c2ab_fk_content_localfile_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.content_file
    ADD CONSTRAINT content_file_local_file_id_9780c2ab_fk_content_localfile_id FOREIGN KEY (local_file_id) REFERENCES public.content_localfile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: device_devicepermissions device_devicepermiss_user_id_7bb0f5a7_fk_kolibriau; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_devicepermissions
    ADD CONSTRAINT device_devicepermiss_user_id_7bb0f5a7_fk_kolibriau FOREIGN KEY (user_id) REFERENCES public.kolibriauth_facilityuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: device_devicesettings device_devicesetting_default_facility_id_8937e0b7_fk_kolibriau; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_devicesettings
    ADD CONSTRAINT device_devicesetting_default_facility_id_8937e0b7_fk_kolibriau FOREIGN KEY (default_facility_id) REFERENCES public.kolibriauth_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_kolibriau; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_kolibriau FOREIGN KEY (user_id) REFERENCES public.kolibriauth_facilityuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: exams_exam exams_exam_collection_id_9dc0b187_fk_kolibriauth_collection_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exams_exam
    ADD CONSTRAINT exams_exam_collection_id_9dc0b187_fk_kolibriauth_collection_id FOREIGN KEY (collection_id) REFERENCES public.kolibriauth_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: exams_exam exams_exam_creator_id_37d1b2e5_fk_kolibriauth_facilityuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exams_exam
    ADD CONSTRAINT exams_exam_creator_id_37d1b2e5_fk_kolibriauth_facilityuser_id FOREIGN KEY (creator_id) REFERENCES public.kolibriauth_facilityuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: exams_exam exams_exam_dataset_id_7dff1bad_fk_kolibriau; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exams_exam
    ADD CONSTRAINT exams_exam_dataset_id_7dff1bad_fk_kolibriau FOREIGN KEY (dataset_id) REFERENCES public.kolibriauth_facilitydataset(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: exams_examassignment exams_examassignment_assigned_by_id_53aa193a_fk_kolibriau; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exams_examassignment
    ADD CONSTRAINT exams_examassignment_assigned_by_id_53aa193a_fk_kolibriau FOREIGN KEY (assigned_by_id) REFERENCES public.kolibriauth_facilityuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: exams_examassignment exams_examassignment_collection_id_90ec6a7a_fk_kolibriau; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exams_examassignment
    ADD CONSTRAINT exams_examassignment_collection_id_90ec6a7a_fk_kolibriau FOREIGN KEY (collection_id) REFERENCES public.kolibriauth_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: exams_examassignment exams_examassignment_dataset_id_3200aa09_fk_kolibriau; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exams_examassignment
    ADD CONSTRAINT exams_examassignment_dataset_id_3200aa09_fk_kolibriau FOREIGN KEY (dataset_id) REFERENCES public.kolibriauth_facilitydataset(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: exams_examassignment exams_examassignment_exam_id_d7c499da_fk_exams_exam_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exams_examassignment
    ADD CONSTRAINT exams_examassignment_exam_id_d7c499da_fk_exams_exam_id FOREIGN KEY (exam_id) REFERENCES public.exams_exam(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: kolibriauth_collection kolibriauth_collecti_dataset_id_5689c7d8_fk_kolibriau; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kolibriauth_collection
    ADD CONSTRAINT kolibriauth_collecti_dataset_id_5689c7d8_fk_kolibriau FOREIGN KEY (dataset_id) REFERENCES public.kolibriauth_facilitydataset(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: kolibriauth_collection kolibriauth_collecti_parent_id_1561ec4a_fk_kolibriau; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kolibriauth_collection
    ADD CONSTRAINT kolibriauth_collecti_parent_id_1561ec4a_fk_kolibriau FOREIGN KEY (parent_id) REFERENCES public.kolibriauth_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: kolibriauth_facilityuser kolibriauth_facility_dataset_id_0dab63f9_fk_kolibriau; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kolibriauth_facilityuser
    ADD CONSTRAINT kolibriauth_facility_dataset_id_0dab63f9_fk_kolibriau FOREIGN KEY (dataset_id) REFERENCES public.kolibriauth_facilitydataset(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: kolibriauth_facilityuser kolibriauth_facility_facility_id_f602d621_fk_kolibriau; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kolibriauth_facilityuser
    ADD CONSTRAINT kolibriauth_facility_facility_id_f602d621_fk_kolibriau FOREIGN KEY (facility_id) REFERENCES public.kolibriauth_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: kolibriauth_membership kolibriauth_membersh_collection_id_c955dbd2_fk_kolibriau; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kolibriauth_membership
    ADD CONSTRAINT kolibriauth_membersh_collection_id_c955dbd2_fk_kolibriau FOREIGN KEY (collection_id) REFERENCES public.kolibriauth_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: kolibriauth_membership kolibriauth_membersh_dataset_id_13e29803_fk_kolibriau; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kolibriauth_membership
    ADD CONSTRAINT kolibriauth_membersh_dataset_id_13e29803_fk_kolibriau FOREIGN KEY (dataset_id) REFERENCES public.kolibriauth_facilitydataset(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: kolibriauth_membership kolibriauth_membersh_user_id_79317fa1_fk_kolibriau; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kolibriauth_membership
    ADD CONSTRAINT kolibriauth_membersh_user_id_79317fa1_fk_kolibriau FOREIGN KEY (user_id) REFERENCES public.kolibriauth_facilityuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: kolibriauth_role kolibriauth_role_collection_id_1fa9ce6f_fk_kolibriau; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kolibriauth_role
    ADD CONSTRAINT kolibriauth_role_collection_id_1fa9ce6f_fk_kolibriau FOREIGN KEY (collection_id) REFERENCES public.kolibriauth_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: kolibriauth_role kolibriauth_role_dataset_id_70eb0469_fk_kolibriau; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kolibriauth_role
    ADD CONSTRAINT kolibriauth_role_dataset_id_70eb0469_fk_kolibriau FOREIGN KEY (dataset_id) REFERENCES public.kolibriauth_facilitydataset(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: kolibriauth_role kolibriauth_role_user_id_d4014967_fk_kolibriau; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kolibriauth_role
    ADD CONSTRAINT kolibriauth_role_user_id_d4014967_fk_kolibriau FOREIGN KEY (user_id) REFERENCES public.kolibriauth_facilityuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: lessons_lesson lessons_lesson_collection_id_13b7d040_fk_kolibriau; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons_lesson
    ADD CONSTRAINT lessons_lesson_collection_id_13b7d040_fk_kolibriau FOREIGN KEY (collection_id) REFERENCES public.kolibriauth_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: lessons_lesson lessons_lesson_created_by_id_441dbacf_fk_kolibriau; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons_lesson
    ADD CONSTRAINT lessons_lesson_created_by_id_441dbacf_fk_kolibriau FOREIGN KEY (created_by_id) REFERENCES public.kolibriauth_facilityuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: lessons_lesson lessons_lesson_dataset_id_da71bead_fk_kolibriau; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons_lesson
    ADD CONSTRAINT lessons_lesson_dataset_id_da71bead_fk_kolibriau FOREIGN KEY (dataset_id) REFERENCES public.kolibriauth_facilitydataset(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: lessons_lessonassignment lessons_lessonassign_assigned_by_id_ed8b2358_fk_kolibriau; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons_lessonassignment
    ADD CONSTRAINT lessons_lessonassign_assigned_by_id_ed8b2358_fk_kolibriau FOREIGN KEY (assigned_by_id) REFERENCES public.kolibriauth_facilityuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: lessons_lessonassignment lessons_lessonassign_collection_id_d30ca20a_fk_kolibriau; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons_lessonassignment
    ADD CONSTRAINT lessons_lessonassign_collection_id_d30ca20a_fk_kolibriau FOREIGN KEY (collection_id) REFERENCES public.kolibriauth_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: lessons_lessonassignment lessons_lessonassign_dataset_id_07c252d8_fk_kolibriau; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons_lessonassignment
    ADD CONSTRAINT lessons_lessonassign_dataset_id_07c252d8_fk_kolibriau FOREIGN KEY (dataset_id) REFERENCES public.kolibriauth_facilitydataset(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: lessons_lessonassignment lessons_lessonassign_lesson_id_52b19e73_fk_lessons_l; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons_lessonassignment
    ADD CONSTRAINT lessons_lessonassign_lesson_id_52b19e73_fk_lessons_l FOREIGN KEY (lesson_id) REFERENCES public.lessons_lesson(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logger_attemptlog logger_attemptlog_dataset_id_3017c88e_fk_kolibriau; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logger_attemptlog
    ADD CONSTRAINT logger_attemptlog_dataset_id_3017c88e_fk_kolibriau FOREIGN KEY (dataset_id) REFERENCES public.kolibriauth_facilitydataset(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logger_attemptlog logger_attemptlog_masterylog_id_d65af27c_fk_logger_ma; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logger_attemptlog
    ADD CONSTRAINT logger_attemptlog_masterylog_id_d65af27c_fk_logger_ma FOREIGN KEY (masterylog_id) REFERENCES public.logger_masterylog(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logger_attemptlog logger_attemptlog_sessionlog_id_0a239a1a_fk_logger_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logger_attemptlog
    ADD CONSTRAINT logger_attemptlog_sessionlog_id_0a239a1a_fk_logger_co FOREIGN KEY (sessionlog_id) REFERENCES public.logger_contentsessionlog(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logger_attemptlog logger_attemptlog_user_id_cd57843f_fk_kolibriau; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logger_attemptlog
    ADD CONSTRAINT logger_attemptlog_user_id_cd57843f_fk_kolibriau FOREIGN KEY (user_id) REFERENCES public.kolibriauth_facilityuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logger_contentsessionlog logger_contentsessio_dataset_id_9b53cdba_fk_kolibriau; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logger_contentsessionlog
    ADD CONSTRAINT logger_contentsessio_dataset_id_9b53cdba_fk_kolibriau FOREIGN KEY (dataset_id) REFERENCES public.kolibriauth_facilitydataset(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logger_contentsessionlog logger_contentsessio_user_id_173ee284_fk_kolibriau; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logger_contentsessionlog
    ADD CONSTRAINT logger_contentsessio_user_id_173ee284_fk_kolibriau FOREIGN KEY (user_id) REFERENCES public.kolibriauth_facilityuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logger_contentsummarylog logger_contentsummar_dataset_id_f9a1ad8e_fk_kolibriau; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logger_contentsummarylog
    ADD CONSTRAINT logger_contentsummar_dataset_id_f9a1ad8e_fk_kolibriau FOREIGN KEY (dataset_id) REFERENCES public.kolibriauth_facilitydataset(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logger_contentsummarylog logger_contentsummar_user_id_16aa2b2c_fk_kolibriau; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logger_contentsummarylog
    ADD CONSTRAINT logger_contentsummar_user_id_16aa2b2c_fk_kolibriau FOREIGN KEY (user_id) REFERENCES public.kolibriauth_facilityuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logger_examattemptlog logger_examattemptlo_dataset_id_9f9d1b24_fk_kolibriau; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logger_examattemptlog
    ADD CONSTRAINT logger_examattemptlo_dataset_id_9f9d1b24_fk_kolibriau FOREIGN KEY (dataset_id) REFERENCES public.kolibriauth_facilitydataset(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logger_examattemptlog logger_examattemptlo_user_id_5442dc41_fk_kolibriau; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logger_examattemptlog
    ADD CONSTRAINT logger_examattemptlo_user_id_5442dc41_fk_kolibriau FOREIGN KEY (user_id) REFERENCES public.kolibriauth_facilityuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logger_examattemptlog logger_examattemptlog_examlog_id_ad0f674d_fk_logger_examlog_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logger_examattemptlog
    ADD CONSTRAINT logger_examattemptlog_examlog_id_ad0f674d_fk_logger_examlog_id FOREIGN KEY (examlog_id) REFERENCES public.logger_examlog(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logger_examlog logger_examlog_dataset_id_13109aa7_fk_kolibriau; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logger_examlog
    ADD CONSTRAINT logger_examlog_dataset_id_13109aa7_fk_kolibriau FOREIGN KEY (dataset_id) REFERENCES public.kolibriauth_facilitydataset(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logger_examlog logger_examlog_exam_id_41856b8c_fk_exams_exam_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logger_examlog
    ADD CONSTRAINT logger_examlog_exam_id_41856b8c_fk_exams_exam_id FOREIGN KEY (exam_id) REFERENCES public.exams_exam(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logger_examlog logger_examlog_user_id_05397f8b_fk_kolibriauth_facilityuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logger_examlog
    ADD CONSTRAINT logger_examlog_user_id_05397f8b_fk_kolibriauth_facilityuser_id FOREIGN KEY (user_id) REFERENCES public.kolibriauth_facilityuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logger_masterylog logger_masterylog_dataset_id_f5b54331_fk_kolibriau; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logger_masterylog
    ADD CONSTRAINT logger_masterylog_dataset_id_f5b54331_fk_kolibriau FOREIGN KEY (dataset_id) REFERENCES public.kolibriauth_facilitydataset(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logger_masterylog logger_masterylog_summarylog_id_f2816f59_fk_logger_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logger_masterylog
    ADD CONSTRAINT logger_masterylog_summarylog_id_f2816f59_fk_logger_co FOREIGN KEY (summarylog_id) REFERENCES public.logger_contentsummarylog(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logger_masterylog logger_masterylog_user_id_3f58a1cb_fk_kolibriau; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logger_masterylog
    ADD CONSTRAINT logger_masterylog_user_id_3f58a1cb_fk_kolibriau FOREIGN KEY (user_id) REFERENCES public.kolibriauth_facilityuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logger_usersessionlog logger_usersessionlo_dataset_id_1a2bbb5f_fk_kolibriau; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logger_usersessionlog
    ADD CONSTRAINT logger_usersessionlo_dataset_id_1a2bbb5f_fk_kolibriau FOREIGN KEY (dataset_id) REFERENCES public.kolibriauth_facilitydataset(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logger_usersessionlog logger_usersessionlo_user_id_a755b0c2_fk_kolibriau; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logger_usersessionlog
    ADD CONSTRAINT logger_usersessionlo_user_id_a755b0c2_fk_kolibriau FOREIGN KEY (user_id) REFERENCES public.kolibriauth_facilityuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: morango_buffer morango_buffer_transfer_session_id_8e70af5a_fk_morango_t; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.morango_buffer
    ADD CONSTRAINT morango_buffer_transfer_session_id_8e70af5a_fk_morango_t FOREIGN KEY (transfer_session_id) REFERENCES public.morango_transfersession(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: morango_certificate morango_certificate_parent_id_60dedc2b_fk_morango_c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.morango_certificate
    ADD CONSTRAINT morango_certificate_parent_id_60dedc2b_fk_morango_c FOREIGN KEY (parent_id) REFERENCES public.morango_certificate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: morango_certificate morango_certificate_scope_definition_id_1f75587b_fk_morango_s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.morango_certificate
    ADD CONSTRAINT morango_certificate_scope_definition_id_1f75587b_fk_morango_s FOREIGN KEY (scope_definition_id) REFERENCES public.morango_scopedefinition(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: morango_instanceidmodel morango_instanceidmo_database_id_3d1b7c0a_fk_morango_d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.morango_instanceidmodel
    ADD CONSTRAINT morango_instanceidmo_database_id_3d1b7c0a_fk_morango_d FOREIGN KEY (database_id) REFERENCES public.morango_databaseidmodel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: morango_recordmaxcounter morango_recordmaxcou_store_model_id_2a91327d_fk_morango_s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.morango_recordmaxcounter
    ADD CONSTRAINT morango_recordmaxcou_store_model_id_2a91327d_fk_morango_s FOREIGN KEY (store_model_id) REFERENCES public.morango_store(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: morango_recordmaxcounterbuffer morango_recordmaxcou_transfer_session_id_1e48e3dd_fk_morango_t; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.morango_recordmaxcounterbuffer
    ADD CONSTRAINT morango_recordmaxcou_transfer_session_id_1e48e3dd_fk_morango_t FOREIGN KEY (transfer_session_id) REFERENCES public.morango_transfersession(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: morango_syncsession morango_syncsession_client_certificate_i_507e0d5d_fk_morango_c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.morango_syncsession
    ADD CONSTRAINT morango_syncsession_client_certificate_i_507e0d5d_fk_morango_c FOREIGN KEY (client_certificate_id) REFERENCES public.morango_certificate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: morango_syncsession morango_syncsession_server_certificate_i_52bf728f_fk_morango_c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.morango_syncsession
    ADD CONSTRAINT morango_syncsession_server_certificate_i_52bf728f_fk_morango_c FOREIGN KEY (server_certificate_id) REFERENCES public.morango_certificate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: morango_transfersession morango_transfersess_sync_session_id_0455b5bd_fk_morango_s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.morango_transfersession
    ADD CONSTRAINT morango_transfersess_sync_session_id_0455b5bd_fk_morango_s FOREIGN KEY (sync_session_id) REFERENCES public.morango_syncsession(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

