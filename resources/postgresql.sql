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
774e91f2-6189-79e1-f810-00b50b69969e	t	f
\.


--
-- Data for Name: device_devicesettings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.device_devicesettings (id, is_provisioned, language_id, default_facility_id) FROM stdin;
1	t	en	79838efd-4f2e-5c61-4e07-07540c4b9ae0
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
1	kolibriauth	0001_initial	2018-05-23 16:25:34.274518+02
2	contenttypes	0001_initial	2018-05-23 16:25:34.313479+02
3	admin	0001_initial	2018-05-23 16:25:34.360862+02
4	admin	0002_logentry_remove_auto_add	2018-05-23 16:25:34.400029+02
5	contenttypes	0002_remove_content_type_name	2018-05-23 16:25:34.446081+02
6	auth	0001_initial	2018-05-23 16:25:34.563539+02
7	auth	0002_alter_permission_name_max_length	2018-05-23 16:25:34.603429+02
8	auth	0003_alter_user_email_max_length	2018-05-23 16:25:34.625837+02
9	auth	0004_alter_user_username_opts	2018-05-23 16:25:34.642084+02
10	auth	0005_alter_user_last_login_null	2018-05-23 16:25:34.670539+02
11	auth	0006_require_contenttypes_0002	2018-05-23 16:25:34.673939+02
12	auth	0007_alter_validators_add_error_messages	2018-05-23 16:25:34.697265+02
13	auth	0008_alter_user_username_max_length	2018-05-23 16:25:34.716943+02
14	content	0001_initial	2018-05-23 16:25:34.745803+02
15	content	0002_channelmetadatacache_last_updated	2018-05-23 16:25:34.762163+02
16	content	0003_auto_20170607_1212	2018-05-23 16:25:34.765711+02
17	content	0004_auto_20170825_1038	2018-05-23 16:25:35.277477+02
18	content	0005_auto_20171009_0903	2018-05-23 16:25:35.354418+02
19	content	0006_auto_20171128_1703	2018-05-23 16:25:35.390907+02
20	content	0007_auto_20180212_1155	2018-05-23 16:25:35.414571+02
21	content	0008_contentnode_coach_content	2018-05-23 16:25:35.495815+02
22	content	0009_auto_20180410_1139	2018-05-23 16:25:35.555717+02
23	content	0008_auto_20180429_1709	2018-05-23 16:25:35.647131+02
24	content	0010_merge_20180504_1540	2018-05-23 16:25:35.649858+02
25	kolibriauth	0002_auto_20170608_2125	2018-05-23 16:25:35.687946+02
26	kolibriauth	0003_auto_20170621_0958	2018-05-23 16:25:35.86941+02
27	device	0001_initial	2018-05-23 16:25:35.914489+02
28	device	0002_devicesettings_default_facility	2018-05-23 16:25:35.94457+02
29	exams	0001_initial	2018-05-23 16:25:36.056183+02
30	kolibriauth	0004_auto_20170816_1607	2018-05-23 16:25:36.138497+02
31	kolibriauth	0005_auto_20170818_1203	2018-05-23 16:25:36.173808+02
32	kolibriauth	0006_auto_20171206_1207	2018-05-23 16:25:36.24987+02
33	kolibriauth	0007_auto_20171226_1125	2018-05-23 16:25:36.298868+02
34	kolibriauth	0008_auto_20180222_1244	2018-05-23 16:25:36.325352+02
35	kolibriauth	0009_auto_20180301_1123	2018-05-23 16:25:36.358892+02
36	kolibriauth	0010_auto_20180320_1320	2018-05-23 16:25:36.386904+02
37	kolibriauth	0011_facilitydataset_show_download_button_in_learn	2018-05-23 16:25:36.422724+02
38	lessons	0001_initial	2018-05-23 16:25:36.539088+02
39	lessons	0002_auto_20180221_1115	2018-05-23 16:25:36.681249+02
40	logger	0001_initial	2018-05-23 16:25:37.286748+02
41	logger	0002_auto_20170518_1031	2018-05-23 16:25:40.431558+02
42	logger	0003_auto_20170531_1140	2018-05-23 16:25:40.586238+02
43	logger	0004_tidy_progress_range	2018-05-23 16:25:40.728655+02
44	morango	0001_initial	2018-05-23 16:25:41.705599+02
45	morango	0002_auto_20170511_0400	2018-05-23 16:25:42.180816+02
46	morango	0003_auto_20170519_0543	2018-05-23 16:25:42.315977+02
47	morango	0004_auto_20170520_2112	2018-05-23 16:25:42.499415+02
48	morango	0005_auto_20170629_2139	2018-05-23 16:25:42.587808+02
49	morango	0006_instanceidmodel_system_id	2018-05-23 16:25:42.690341+02
50	morango	0007_auto_20171018_1615	2018-05-23 16:25:43.818269+02
51	morango	0008_auto_20171114_2217	2018-05-23 16:25:44.093508+02
52	morango	0009_auto_20171205_0252	2018-05-23 16:25:44.126198+02
53	morango	0010_auto_20171206_1615	2018-05-23 16:25:44.166939+02
54	sessions	0001_initial	2018-05-23 16:25:44.207796+02
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 54, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
xt3w12a0dwuet5cdgzumpwbis0lguu57	ZjY1YjIyMzQ5YWZkZDNkYzc4ZjA0M2I4NWFkYjc0MTJlMWZkZDBhZjp7InN1cHBvcnRlZF9icm93c2VyIjp0cnVlLCJfYXV0aF91c2VyX2hhc2giOiI4NjVkYjQ0YjkwMDliZGQ2MDMxMTc3MWFmN2IzZmUyNWVkMjVjZDNkIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoia29saWJyaS5hdXRoLmJhY2tlbmRzLkZhY2lsaXR5VXNlckJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiNzc0ZTkxZjI2MTg5NzllMWY4MTAwMGI1MGI2OTk2OWUiLCJsYXN0X3Nlc3Npb25fcmVxdWVzdCI6MTUyNzA4NTU2M30=	2018-05-23 16:36:03.297744+02
8wjusugdh30dfcvc1ilq8e2x13x0zczb	OTc1NjAyZGNkNjc4MGYyODJmODRiZmRhM2UwNzNkMzczOGM4OWMyODp7InN1cHBvcnRlZF9icm93c2VyIjp0cnVlLCJsYXN0X3Nlc3Npb25fcmVxdWVzdCI6MTUyNzA4NTU3MH0=	2018-05-23 16:36:10.087672+02
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
79838efd-4f2e-5c61-4e07-07540c4b9ae0	t	17028a5e9e3744c6921aae285299e6cd	ed957d6aedcd6b783fa0e8cbef55d2bd:allusers-ro	velox-facility	facility	1	4	1	0	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	\N
6831d49d-65fe-113c-c8df-23bb874f17e6	t	fc363fc135294f0da88f25f73a9fffee	ed957d6aedcd6b783fa0e8cbef55d2bd:allusers-ro	Classroom 1A	classroom	2	3	1	1	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
\.


--
-- Data for Name: kolibriauth_facilitydataset; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kolibriauth_facilitydataset (id, _morango_dirty_bit, _morango_source_id, _morango_partition, description, location, learner_can_edit_username, learner_can_edit_name, learner_can_edit_password, learner_can_sign_up, learner_can_delete_account, learner_can_login_with_no_password, preset, show_download_button_in_learn) FROM stdin;
ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	t	ed957d6aedcd6b783fa0e8cbef55d2bd	ed957d6aedcd6b783fa0e8cbef55d2bd:allusers-ro			f	f	f	f	f	t	nonformal	f
\.


--
-- Data for Name: kolibriauth_facilityuser; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kolibriauth_facilityuser (password, last_login, id, _morango_dirty_bit, _morango_source_id, _morango_partition, username, full_name, date_joined, dataset_id, facility_id) FROM stdin;
pbkdf2_sha256$36000$Ev69zTkp7rN1$WDNoAmFfGqCRMt/mEpIP7eRt2XFptg0XrcH0TN+ViDo=	2018-05-23 16:26:02.512146+02	774e91f2-6189-79e1-f810-00b50b69969e	t	41ea4e57dcc64122bbf6504857d7154e	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:774e91f2618979e1f81000b50b69969e	admin	admin	2018-05-23 14:26:02.384095(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$O2Y7byhI3qaf$uZPPL2EVyBnpEvvfPmGD40thjyh+YV5W2+MKOKELzzk=	\N	342a6528-840f-1c1a-e6c6-f588c826550b	t	648fb5b3480a48a29bcece06dab95f58	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:342a6528840f1c1ae6c6f588c826550b	Nurs1975	J Božena Ježková	2018-05-23 14:26:16.702473(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$K9KSHHm4cNx8$MO+aVxuRsFokrMfqu9HmidZjKFsOusxXtK9syHmuFTQ=	\N	c940785b-e15b-9246-003b-df3fa714e081	t	f7c39836e4b144d1bb5daa0da68debc2	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:c940785be15b9246003bdf3fa714e081	Mouggly	R Otto	2018-05-23 14:26:16.740350(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$yVKaJodH9qZe$/IOXF79xwud3xDPdLH6Mp91jtZShoLSIJ8Ji9f0TMXc=	\N	dabfd9cd-5868-692a-1631-42239bd57c0c	t	d5e027ebaa984fe68a61f999808823ef	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:dabfd9cd5868692a163142239bd57c0c	Othem1940	B Øverland	2018-05-23 14:26:16.771727(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$qeGm7iRNfwB4$bIKr7wnbrg4dmHiDIK4wLKbUk0t0FQAWfv5t/G+zoKM=	\N	e882668b-eedf-4a5c-56f4-cfa1e5d4c42c	t	4597f63fa62a49d0be63cf2233154509	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:e882668beedf4a5c56f4cfa1e5d4c42c	Evemper	Marcel Jensen	2018-05-23 14:26:16.808360(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$5b7xCqMQlqov$zMNz5FrH3xl1Bdc9ekW8qfjTg73vp/lKSPWSJA29Org=	\N	be6901b9-f527-c56e-ba71-dfe8c337fbcd	t	f3b4a5979b6e45a2a17c6eea44b82c22	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:be6901b9f527c56eba71dfe8c337fbcd	Grins1942	R	2018-05-23 14:26:16.848686(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$wfPH6lHO7XY9$/HGhrYJEIeeCDCC/EUuBtXcZnbL7tuTi5GpVHkYOcKs=	\N	2bcda18c-d446-6ac5-a9d8-073c85fcc082	t	a71e9cd78c104993a7e273dd4d1c1a12	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:2bcda18cd4466ac5a9d8073c85fcc082	Fices1947	ten Donkelaar A Dingena	2018-05-23 14:26:16.877645(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$I3ZWmqnRJvu9$+J+H7qfd/bQD6S7AFMpWftSrfwycnmwqoKvHfo4HExo=	\N	17995731-0e5a-1b1b-ad60-a4483c7c0b73	t	a27299dfee2c4c03b60646a8d26c9780	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:179957310e5a1b1bad60a4483c7c0b73	Ationvin	Saliba	2018-05-23 14:26:16.923069(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$Oh7VshMUPP2P$4LOM2dIhHvXo3ooPOhemDkbxGesaw1VMlEGBGc7Ik04=	\N	99909c93-fee3-0d21-cdf1-af0ee2cb6287	t	30cc511943154c35945566068a7e8238	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:99909c93fee30d21cdf1af0ee2cb6287	Boody1975	Keishuu Kawahara C	2018-05-23 14:26:16.951646(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$vj5EMFCCRc67$iIZoyrpRSL5hkZHuKuIf+WJDKlEtR3zih9HjbbncXU8=	\N	4656efa6-3d07-1952-cc77-c308c7572496	t	c32bbd55ad154884bf81c2a3bf3bc82e	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:4656efa63d071952cc77c308c7572496	Dowent	馥羽 秦 于	2018-05-23 14:26:17.001756(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$BPe2FMPCbAdy$6bZcBe2VmoooIKS+enOFxol7LsZRXixXVP/Y6kMBfVI=	\N	91f1c49e-7766-6aa2-0316-6f90ca331c78	t	973b296e35f849d79ffe6af28fbd82fc	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:91f1c49e77666aa203166f90ca331c78	Ventlestaked	Isabela Sousa	2018-05-23 14:26:17.039976(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$5pNmIY0dFW7l$S7ub/uYxsR6SNGPXhOnYBvNSUyFzcL91KtyRhpNKJD4=	\N	0da91db4-5ab4-65c1-3995-1d45593e2eb4	t	3a6677d05e4644d0847a988c8c2ee774	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:0da91db45ab465c139951d45593e2eb4	Arage1941	Yukaho Yamashita	2018-05-23 14:26:17.074371(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$0MZ9LgsLPjHt$L9+5m+Xrq3/eifbnm2S1+oo1OxPWC4m0Zf6pIcsrfRY=	\N	c5e61c55-de1d-7382-17f5-8aefea34c13a	t	e47a43f6db9d44ac8fb9b025cbc4ae66	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:c5e61c55de1d738217f58aefea34c13a	Pravall35	ร ขวัญฟ้า โล่วณิชเกียรติกุล	2018-05-23 14:26:17.104053(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$ycbiSiOZ285r$SeY9Dpgv95CusOvGW4N9kU5mpH39h2lLFviFDg7XX2s=	\N	79c7dd12-76df-675b-9cbc-20cc0b4306ba	t	de99b5fe860642c8b21f47ada2f300e5	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:79c7dd1276df675b9cbc20cc0b4306ba	Resat1987	Đ	2018-05-23 14:26:17.135943(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$CfE9ILV4aAKm$KgMGiXxVi1llac/VXf3Sz1P7SDMA3EjUMuCYu9TE2B8=	\N	4972ecff-bd52-eb56-3732-f58cd2da7ab6	t	e09a38068aea45558d0ab256d3748432	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:4972ecffbd52eb563732f58cd2da7ab6	Thinty	Phoebe Hunter	2018-05-23 14:26:17.164300(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$sNrqlVLT4sb6$fWCz+qMh68kcmrhFf+vBpVYPMFYFl8+pwy9KGbCkoSM=	\N	9791e2fa-3a05-bc03-4ed7-c3056be534e8	t	f58cb9787968402db88906ff84180ef6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:9791e2fa3a05bc034ed7c3056be534e8	Wishoune	C Nnuego Odili	2018-05-23 14:26:17.192593(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$zzd82tRxZmgZ$oSvf5SXeuAS4v7Q1Ifx53kw2KRfb6OPImhShr6D06lY=	\N	b74d32f7-4abf-1d64-02db-a8bfbd94180a	t	ed89525a96dd443cb5fea1bfb6801923	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:b74d32f74abf1d6402dba8bfbd94180a	Repliseen91	Nhớ Kim T	2018-05-23 14:26:17.244185(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$yxdYVJ7LOEk5$OISCvU+YWr2V5q4yNZxXjH8lSuGZO0UKeO4z37rtSmo=	\N	327fc49d-51f1-043f-4454-9df6f36f11e1	t	0e68ea097e554ccc8a4e8dbae0b634fa	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:327fc49d51f1043f44549df6f36f11e1	Ingled	Helvi J Hietalahti	2018-05-23 14:26:17.272620(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$NxbL7OWMSAmM$GwlJ19INP0tH3Ics2qHYajCli0FUmjT0Qkdna32qn84=	\N	acd1a000-90f6-d5f0-0a04-3b25a94270e1	t	ba481578460946d7aa5fbc90195212ed	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:acd1a00090f6d5f00a043b25a94270e1	Criongul	مهراب ه	2018-05-23 14:26:17.301436(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$qKRYVVQfcmnq$q+jxejKZ/vCbwuTMsP4GeRu3ChTNfWDWpsa292/54Y8=	\N	c2e9c7fd-6c3d-5f6d-d60b-eecfff98d60d	t	1dbdcaff34e44e81a18443264b668fe9	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:c2e9c7fd6c3d5f6dd60beecfff98d60d	Herfulity	昇 怡如 沈	2018-05-23 14:26:17.330622(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$PtFt9P5UCQwk$T5FC8LQBe1sWP025+AqV34dQVbKfbqgS2RpsqBInfPw=	\N	2f623cca-974a-0c00-bcd3-2502b410ac88	t	ba2ef29278e242edb0abe7f9ab3fdde1	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:2f623cca974a0c00bcd32502b410ac88	Comens	W Marian	2018-05-23 14:26:17.360358(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$nwLvVQZFY1up$6hWAeUy6DRxoUcNHGpWBpzhVC74D5Q4TOTUr4Nmoq/A=	\N	db83e0f7-7c60-39d4-9fe8-65393f77cb6f	t	20ccb279fb024bbc98a17b7841cc467f	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:db83e0f77c6039d49fe865393f77cb6f	Wittleen	Askade Maang	2018-05-23 14:26:17.389332(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$ZAArTRcTRcVx$ySNmnPmMk/UvzaN8pOwsouJz8gVMRfeYcQaiOY+fPBA=	\N	f310c74c-11bd-0e03-d593-7f312d6f6430	t	0bbe2e7a0bae4262abb8147e897a627f	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:f310c74c11bd0e03d5937f312d6f6430	Honpon	Lima	2018-05-23 14:26:19.694960(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$cBTO2zKfs50v$bcMzdX63BkHaKe+G05S88n6iDvprXWWj3GKf75fKlHA=	\N	4f694261-9a93-b2c6-f34d-ff735b935fab	t	cbe73125b662408e88d346360c873978	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:4f6942619a93b2c6f34dff735b935fab	Tands1966	Pallara Ch'Mira K	2018-05-23 14:26:17.426398(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$pRV4sLJkWSnI$kPoRCzjNJvAmnkUt+ZSnP/NR3T+M3zGPbvfaLqt7ufA=	\N	1c1bd7ca-318e-33f3-0097-835da12ac0de	t	0d980594f64b42c399c327855c419ab8	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:1c1bd7ca318e33f30097835da12ac0de	Sman1957	Petrů	2018-05-23 14:26:17.455758(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$7Enr2HuiM5cK$5R3NZipgUvexYPLnynQRU3oHohfSEV0cM/c+N91Rh68=	\N	943ff6a7-24a3-e952-7922-e5a10ece0167	t	c947f2c667914b0e95a990ce69dcd1d2	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:943ff6a724a3e9527922e5a10ece0167	Cramarly	Jimeikuto	2018-05-23 14:26:17.487249(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$gtIcbv4IpD8B$BxxbL/Fho6kWC3VIYMkqfFIibmnbLl/JRpX98HPomzk=	\N	af7d98e3-2886-cec2-9f2c-c658ef11084b	t	2eea4a769cf04fecb4ab3a42d17c8877	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:af7d98e32886cec29f2cc658ef11084b	Daystagethe	Zvjezdan M Kamenik	2018-05-23 14:26:17.517521(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$uGR4KxAUvQgr$eNSH5+miNroVLfiBeFazhLFoZANVRni5Pruajyg9J3o=	\N	80b69ac6-174e-f1da-bd1a-f7bffe5b8715	t	dd976bef8abb4e2fba52f05d704c24fa	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:80b69ac6174ef1dabd1af7bffe5b8715	Thapide	Émile A	2018-05-23 14:26:17.550756(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$L6FU5X9NYdeQ$1BQIGh4ePlvQRPo+c5FZHTJeJ+4paC59Dzv2Bba80J0=	\N	d4b5f5aa-6784-9289-3eae-301a3b5a9874	t	8a70c1b8d2e24fe388ca2c42bd8f9a2b	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:d4b5f5aa678492893eae301a3b5a9874	Himmors	قزوینی ش بهنام	2018-05-23 14:26:17.590234(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$xsNPQ85X7Ntw$+7j9dSI1YjUppXoWcos6P/5J5+Q3HYlppa8yGYXuByo=	\N	fd6e8087-7197-aeb2-4651-2e2d2d8e0da8	t	7ac032ec73894ec4b81803616b8d9d45	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:fd6e80877197aeb246512e2d2d8e0da8	Butiefull1965	Alphonse A	2018-05-23 14:26:17.625794(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$WOI6QS6ZMQro$XqBpwv4HxsVUFhmLkaOB9vyeBYhkMD5QwhssvL45M18=	\N	91d5fd3b-be70-baf8-21a7-bee551265d39	t	d967e371e4db441983627975bb149512	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:91d5fd3bbe70baf821a7bee551265d39	Notho1951	ทวิชกร อเปสริยโย	2018-05-23 14:26:17.654704(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$bgWhkmemqjQi$lhIop87qu1rE6EapJ9JhOrzulQ+QrauPtTPTlH26+cw=	\N	2d263f54-c006-26dd-2531-955763c05344	t	957d002fbefa468fa9843fb954b30414	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:2d263f54c00626dd2531955763c05344	Decul1976	Amina Asfaha	2018-05-23 14:26:17.683207(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$dwqNEJlIwLl1$jotGSbYKJxBxpK/cy+vp0gmcyqdlYcTctUq6h98J1hw=	\N	6ca0c2aa-76ad-d187-3476-4856a5cb72ea	t	e33806000db143c2943ffcab0e132f5b	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:6ca0c2aa76add18734764856a5cb72ea	Therrom60	Axenni	2018-05-23 14:26:17.711655(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$6QB6tJ78vnV5$Ne0IXPGwO76gYJiU7q8z11Z5yexxckNxhC+q98Svb+8=	\N	83599af2-8976-f401-d0f0-49bc9ed4734c	t	91ffe4989bcc4bacadb2f74b488e6fe6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:83599af28976f401d0f049bc9ed4734c	Coma1950	Axel Halvorsen I	2018-05-23 14:26:17.739354(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$OSm4wj07SrUc$9OoPCyyE/VgPG/Nb6TEdAPhT8IIwbYvoFWS3n2RyZAQ=	\N	2e25fd3d-dea6-15b4-281c-58042b4bc576	t	b9dc756e22db48a3a9eabcbd60923054	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:2e25fd3ddea615b4281c58042b4bc576	Drind1972	Durr Kristin B	2018-05-23 14:26:17.768308(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$kRxp8n5t8RWe$bLMjrz+I/+k0YXTA21yTNljA5LxaaGdOUh+v4jE+eqg=	\N	a02240df-ffbc-8da7-9420-1eb3038f24a3	t	33d684e33d79447ba90afaa47715dd72	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:a02240dfffbc8da794201eb3038f24a3	Shent1950	Zawadzka K Brygida	2018-05-23 14:26:17.825517(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$KfBKw6rkhXEZ$/swdWdkSPQcxJtuD9IEglkIq2y/IM+/QKCcIZZvOrwE=	\N	3d5bde2d-0c13-66f2-1a06-e0791d8451ec	t	1aa040bba0a24d609e6ad5337489da89	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:3d5bde2d0c1366f21a06e0791d8451ec	Derearthe1960	Takitoteka	2018-05-23 14:26:17.857134(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$dNkwUzFvxbjs$hqm9ofwSkW5GTVYp7zUR1OpZSMmUiJv52MbFSt7T78k=	\N	775d5b12-f8a1-9f83-34f2-f0f7ea1e8d54	t	13e504ea7d2f400e93c4688c95f848a4	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:775d5b12f8a19f8334f2f0f7ea1e8d54	Hippoling		2018-05-23 14:26:17.885245(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$w9xUF89DcsPV$IQJwmN5UvmXAUXrj7+sdGyunRv2nKEZXbKZ3UrJ1dkQ=	\N	2d7b3487-1664-8fa3-f6ef-5b46a902452f	t	d6eb95d1a6f64b3d82780100351cc130	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:2d7b348716648fa3f6ef5b46a902452f	Linut1942	Madina	2018-05-23 14:26:17.914279(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$RgdGr4TOmjsR$35Biz/sWjT/nA5mX2x7O9gabGsf3ulykXJZpqwiL5dE=	\N	d6378b1e-12ce-ce17-831b-3bb41c806d47	t	27003c3712e34539a2880b4e76400b82	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:d6378b1e12cece17831b3bb41c806d47	Hippoling1998	Исаия О Агафо́нов	2018-05-23 14:26:17.942338(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$1Zwai0aaPwUn$1HtveXcKx0Tdd8nNtJtjtAoUGpdKqm5zZQq5aCC62MI=	\N	4b706273-239e-8322-3bf5-3ed36791ede7	t	7ec79f8e8fe74b30add9ee138677db4a	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:4b706273239e83223bf53ed36791ede7	Cled1987	Э Альберт Зо́тов	2018-05-23 14:26:17.970581(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$XsVQRXZoi5qK$efxq2JDLY0QxDEJyBAcQmZts0P2/EA7+CFQw78uNCSQ=	\N	e47f3e2a-0d6d-2348-bae6-fa9e68df6bbc	t	258498188a7f47648483d768e92acbf6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:e47f3e2a0d6d2348bae6fa9e68df6bbc	Hestake	M Auclair Kari	2018-05-23 14:26:17.999256(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$OWCpMP1z6W4h$8hFW60MlAlZAVYXZ/TCCb1E/nGGb3rDCSMMUA723Jd8=	\N	1562c302-96f2-eddd-1368-2151250fb247	t	9502b21488674d939f380980068942fb	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:1562c30296f2eddd13682151250fb247	Leguiry	K	2018-05-23 14:26:18.027119(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$pAOWkOF1jXPd$MnUwCSi2T8lRt3rpjDYtkS77cAq17O+g/gVJ05Gc48k=	\N	b2b5a41a-e8c7-9322-5bea-bd457b292d8e	t	85fa246c86d74917aefc47e1071b30bb	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:b2b5a41ae8c793225beabd457b292d8e	Wolk1939	Nikolai	2018-05-23 14:26:18.055339(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$NxFLLxiwV9Ou$p24W/81BzKMCDbku1Ff5dzvvlAILNP0EjXiQOuJmtkU=	\N	fbf7b73d-0ac7-bd90-0fef-24d0cda56e57	t	425be1cc7e7f4ae29e172d6f9aa2f326	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:fbf7b73d0ac7bd900fef24d0cda56e57	Pulty1977	Borrego	2018-05-23 14:26:18.115127(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$eEpcRQhyOrZ5$x1s3Y8R72e6XQ8w4Z0J3N6Tt+WrB7Ykevhakx9/Mt7M=	\N	c08fcfbd-1d36-b505-214b-2ada8ec56c35	t	7b2ea21d1f1243fb8bcdda86f6a47089	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:c08fcfbd1d36b505214b2ada8ec56c35	Pletent	Naser Kasib A	2018-05-23 14:26:18.161479(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$L8TGWdUJ1Knf$wfOInWzGhP2nDEjnqr+6x/d+xsFFlDA+7JEj/vfdhUc=	\N	1baf4851-dd79-b79e-ee63-f0ac74da4f22	t	765b96967dc64e95b4cfe10abcc9b12e	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:1baf4851dd79b79eee63f0ac74da4f22	Bitterephe	P Mandić Elizabeta	2018-05-23 14:26:18.189597(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$GM7PgaWCxYNK$bzEn12WPjy8ZyfOGd5HOWHJOQCQSYNmacbrLKirmjDQ=	\N	6c32b718-db33-4daf-5ab7-99b4673a0736	t	6a899ef9434347bbab5f2584c1b2418e	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:6c32b718db334daf5ab799b4673a0736	Windepped	Boža	2018-05-23 14:26:18.218428(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$X4VyuVk5bMel$lyvRWloDa/ockyDinp6XIpCR11/tuIplUaBhBKKI6GQ=	\N	535d0f4a-7c73-d6c3-1a31-cf8d78e58fe1	t	cb976863887f4b4195f2914e1a1d5df8	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:535d0f4a7c73d6c31a31cf8d78e58fe1	Lowitood	D Kunze Christine	2018-05-23 14:26:18.248038(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$wB9H5aQZ1J2y$NdQZN4q/Mt3T7TDmJUqrLRgaPwC5wdJaekCpC/70dF4=	\N	02c5ba51-6c8e-82f0-8c41-0a080f7befb0	t	c95034875e5045ab8011bd0b9ce7c59c	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:02c5ba516c8e82f08c410a080f7befb0	Gresto	Gavrilova	2018-05-23 14:26:18.291724(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$TyxRL4Zx0dZP$j7ItmYG1kOLvc/qRxpuUPN7310bvfrLndstBPMQpZjA=	\N	1bb6f92b-6318-83ed-2da5-d15e5326c625	t	970fcd695f3e4fb486267faf14071800	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:1bb6f92b631883ed2da5d15e5326c625	Ebothe1954	Malwina K Woźniak	2018-05-23 14:26:18.320480(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$Gg9BCMm91ulG$oxBvzXVc3iTyDuA+oudP+3CkT9wbzRAOx0SAhE0vxj4=	\N	cdd13812-0975-4c41-02af-1954077ea377	t	f9496d01401a406bac42aae33accd4f9	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:cdd1381209754c4102af1954077ea377	Wingthe	Asmara	2018-05-23 14:26:18.361223(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$ILdpoLmbkXcy$jvUZWn7zMwk5xypZi71YLfT2aGr6NxWJDTrFXvfQOnU=	\N	9e1bf550-1b54-9735-91f8-e261cd03f753	t	d403a64b92d74fcc8b248f4749e252aa	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:9e1bf5501b54973591f8e261cd03f753	Thenall1957	Kristine	2018-05-23 14:26:18.389839(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$mwfhuMo23IDa$i/kQCei7kwfuKP2wY5HeJreDrvU62xIfllncE87b6nE=	\N	20a93c32-0370-41f4-61d6-32e1028cdce1	t	1ef1e8c5b2364e92af017dc002689e0e	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:20a93c32037041f461d632e1028cdce1	Theas1959	M Florian Koenig	2018-05-23 14:26:18.419205(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$Nt1WbCKfGmNA$WWvRvO4YyUsRG+DYvDEqPT5nklgHtkWsbzgzdlUwvHs=	\N	b9ec9591-2c88-cef2-c8f3-c0e1660e021a	t	0d4ecf7ca69548e0b025b00ec9ec2a34	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:b9ec95912c88cef2c8f3c0e1660e021a	Agartudded	Kumagai	2018-05-23 14:26:18.453331(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$0xe2irUH3zpx$JnALe8fZSYy8EG/57VVGv6rmiVK+VjJYuPkrob1wh90=	\N	18ee6ab3-83dd-376f-75fd-4707648c7570	t	05840673f0524e9181eceeecb510c4c2	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:18ee6ab383dd376f75fd4707648c7570	Whismainfits	柳	2018-05-23 14:26:18.485895(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$g6MKblbSdNCH$oY2M0X+WwTR9wfKnZc3zA4Vnh/judPOUN+xspy/D+Bo=	\N	f77e8a71-91ab-d825-11cd-701a4b561fed	t	032c417f41724a7dac060b2bab7653b9	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:f77e8a7191abd82511cd701a4b561fed	Quart1990	Fleming R	2018-05-23 14:26:18.514727(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$Xg0mB4tIfoJ1$ek4X7NaxIkLUV7nAmyqH38ZDeSkfIYL+b8gVHJU8OOM=	\N	37ff65cb-c333-bcce-4162-5072815e6121	t	c4edb63e6e0a4595b0f1c7bfe31c4fd1	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:37ff65cbc333bcce41625072815e6121	Altobjews1977	Thorsten	2018-05-23 14:26:18.543135(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$vOk37xv92M5O$MBY2F1rHlD/V1BasapNpk8EhCYFOfh9Y+SD/cGAit/E=	\N	753fe5ba-73d4-fd77-6ad3-bdf3e87cb6f4	t	7307257c80fc47b8898b81be9ad6b526	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:753fe5ba73d4fd776ad3bdf3e87cb6f4	Effir1962	Leah L	2018-05-23 14:26:18.571027(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$Ai1Ui2no4rwB$21ZR+xpcMmNHsUGW0sXyA7tqFRMTGu4snQ8/+cA9vVI=	\N	a7e50f25-6343-0516-7271-678dc745faa3	t	c611288de10741c2a0cdf57902f6e0e0	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:a7e50f25634305167271678dc745faa3	Spaccur	Kirsten	2018-05-23 14:26:18.598991(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$TDuqqf4ngNyy$UXy7UhbsNGQBmS1kQ1rhCn4cC1/sqoVcOQ7YxcfzmJc=	\N	e2e4b77f-635d-c171-0f74-df3ded63ce89	t	09816f30aa7147e29b296b8a619d7b87	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:e2e4b77f635dc1710f74df3ded63ce89	Horce1963	Riia K Nikulainen	2018-05-23 14:26:18.628370(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$HsAfFp3FhtMp$Bcl6cJh5+DngJOHIG65ZNWcYslOMwli35E+FpnVnZYc=	\N	045e5aad-ab6c-d9d4-5acf-b96bd968a613	t	e14ed60317934007bbf32bd2ae7244a3	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:045e5aadab6cd9d45acfb96bd968a613	Welvere	Maria	2018-05-23 14:26:18.657127(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$PnpkThnt2DKD$+aZa9Z79+wa6i5b57ttCJtid9w08OmEEPXi4uDH8gFM=	\N	e0a3ebaf-934d-ba2f-baac-e8bb6f9e3120	t	338e680f7e2e4614a95c81b1d3c60aef	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:e0a3ebaf934dba2fbaace8bb6f9e3120	Wisequed	Okazaki S Sae	2018-05-23 14:26:18.690087(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$czA0RFhPuDkE$lp+iJ2ynt/4vtGBWb0wpTXSFTk9Yn1QFvY/XaI5wAk0=	\N	92862228-911f-eb24-e290-9224bf46ec35	t	98609a8dc451467cbe6195ac7b5ead1f	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:92862228911feb24e2909224bf46ec35	Hielper	S	2018-05-23 14:26:18.728284(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$n0DqmD5piLif$R4p2QYWjP7LCN1Kqv4boHIF0YunE8qykgCea3WddcfQ=	\N	3972d7fd-0b6d-126d-2106-917295d041f1	t	cbd394ac03ec4ddbb005740968a14573	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:3972d7fd0b6d126d2106917295d041f1	Awallaid	F Fernandes Matilde	2018-05-23 14:26:18.756846(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$FQwrBcZCmBVJ$f9FXPLrz7mw/SXl6J40pWe3xvHpCYvbBZf18VHUEsp8=	\N	13dfcb22-5871-f867-1e58-ddfe992fa5c9	t	e38430cc42b74666ba8bd9b5d008f364	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:13dfcb225871f8671e58ddfe992fa5c9	Sornint	R	2018-05-23 14:26:18.785398(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$pTSwAvcMQ3b4$Gyd5lGn9ZXX4xW6ceDUzpfB7HIEac/v482JC3nIdvVM=	\N	2dc72fa8-3033-4a0d-76b1-d6a7b023f981	t	59855e07bee94438a95d8abb968d3f20	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:2dc72fa830334a0d76b1d6a7b023f981	Lormand	Visiyta	2018-05-23 14:26:18.814023(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$uJHcyFAjqELA$GIR1LxZByXSlKITstoTIi94ppxm9SkZub9/N1W95vHI=	\N	d71ebb6b-a8d3-52ad-cb07-f0fe664ef343	t	e1024f34d9064b4fa6a807556cc318e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:d71ebb6ba8d352adcb07f0fe664ef343	Qualry	Esila	2018-05-23 14:26:18.843544(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$tyijhFiGnVhK$biITP90c4Cq8YWLY8DOQ+6S+2QnysFvAk7o4DQLJIaE=	\N	e90b4db5-bc7f-a51b-8384-a2f15e869442	t	7fea67adb88f45b8ae77a050395fe7e9	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:e90b4db5bc7fa51b8384a2f15e869442	Whicenty	L Lu Rong	2018-05-23 14:26:18.872428(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$A3fAt7MhCRiD$HH2GsT7WkpyAPdIXRtr22NNYX1brCHKtZjrvsXLU3b8=	\N	c679ccef-2ce2-4eea-6a7c-fd8800d7e641	t	f592bfc394b644059cb30aacb63287d5	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:c679ccef2ce24eea6a7cfd8800d7e641	Wilver	美 蓮 若佐	2018-05-23 14:26:18.902191(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$ZzbjmJuLEasn$TtJF6tDvrBsxE6QJiOaqMDKIU6q9d83YEDPTqFqMUQA=	\N	1eea7520-87aa-bdb5-0698-ed01c3b91c4c	t	daf9af6bde604de3a134d8a9a841a2cd	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:1eea752087aabdb50698ed01c3b91c4c	Onlyzen	Moore	2018-05-23 14:26:18.935374(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$te2NOohVrEU8$9md+/YstOmJ8l/BDg4J9z6QBPW4WZQ5sCSAR7c6sD3Q=	\N	306e9383-1d09-c035-f966-cb6e4eedcece	t	0e7fcd831fd542b58e4c016c80f5c8a9	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:306e93831d09c035f966cb6e4eedcece	Marin1941	Falak Amari Z	2018-05-23 14:26:18.969739(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$HxOyRgmrd95X$lfi3Qr4CC80t618b35iLMyRrGuR6LJSu4H6oZ9ci3Uc=	\N	21cc5afa-3ff7-92d1-03c3-61c30fb95032	t	9f05d950397040449731bf5fee1ac222	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:21cc5afa3ff792d103c361c30fb95032	Raident	M Ivalu	2018-05-23 14:26:19.011712(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$9P3wCYnq5ppD$UuIGWpGy55VhK7nJ6Gz8g+DdaO2O4bGCoRmW/YpuLbw=	\N	c43c4f55-4be4-cec2-5b79-abeeb789bf84	t	856e2fb0e9ec4cc4b3f02c9a0317dbb4	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:c43c4f554be4cec25b79abeeb789bf84	Frincong	Silvestar	2018-05-23 14:26:19.039941(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$FXLDe6p2eYql$NzYnhFFx/F4BoIrDncHVDn/WH1a4HwOJNOSWb9O7JVU=	\N	c9568622-58c9-16d1-0247-632252f92a0d	t	fb366d8e932145a6876d9e695734c20c	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:c956862258c916d10247632252f92a0d	Thandsoll1990	M	2018-05-23 14:26:19.068141(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$evtADj9DcXtW$n4gNJP68GJPliRG7G1clA8ZerjR4RKNolDjU+ETmPA4=	\N	04f2c83d-180a-610e-2161-df8c2985a669	t	542196e2235349e59f9d035889bb732c	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:04f2c83d180a610e2161df8c2985a669	Terefuld	Gojslav	2018-05-23 14:26:19.111505(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$NbNq6RT7BGH8$ZuJ8CVkQo7HS2xpChFXZX8MbCMYQiGonOziNx+PpGqQ=	\N	c88b6ebb-a69c-5b19-a2bf-fd431b66b868	t	0599fb47ce9e4d64b8bec7987216c4cc	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:c88b6ebba69c5b19a2bffd431b66b868	Antene	สุนงภรณ์ ท	2018-05-23 14:26:19.143436(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$og9pzbCuSgxa$LdYU32R3MUzJ3dkeGGb6Y7D6w0iHQFoh4vaB2Cuz2u8=	\N	3b5c809f-9d3c-e11b-f2d5-0c978a9cb7a7	t	cea1176892254c5586e634f84a90373b	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:3b5c809f9d3ce11bf2d50c978a9cb7a7	Satelf	Успе́нский Исаак	2018-05-23 14:26:19.186703(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$pkQGpccuzOyx$IxAufm/4lWsGuaNtziLWnWaA8fwramBLjUqD0gGe0+c=	\N	007ba9cb-46b9-8a91-478b-66f2ddfe7b98	t	950c3437f3f541b0bb68910385d9c7e5	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:007ba9cb46b98a91478b66f2ddfe7b98	Notiff1986	Aman Nasih	2018-05-23 14:26:19.215080(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$erMxCADxpbUq$29LlSi/gxgnZwlG0vjGkrpwUVSnFDR9pvWFRWRXP44U=	\N	61404ee7-09f6-950d-f096-aed8bf33ad49	t	8be99d527de6496db7aba3b07204fe5e	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:61404ee709f6950df096aed8bf33ad49	Sietaing	Gundahar L Tûk	2018-05-23 14:26:19.243185(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$swIluRBZwFPd$5lyEM82w/Gezz2xSHjFs2j9Owd2qAGp5hh+1b486Xoo=	\N	1e1060a9-8ed4-26b8-fa3b-c6a265c5292a	t	8b3c18116172471a94edaebcd5da3965	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:1e1060a98ed426b8fa3bc6a265c5292a	Picted1934	Piia Manninen T	2018-05-23 14:26:19.271616(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$FYsOHXYjvGBD$aJJwIXThRNHKa1kYmufMlSylbsFIr2qR9dRIcauIs7Y=	\N	19c45401-7270-34b1-8cae-5ff8482b4ab4	t	b9b74d13a7d34bbda809c5324becd9a8	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:19c45401727034b18cae5ff8482b4ab4	Dicitch	Martina A Kolmanová	2018-05-23 14:26:19.299288(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$Pkat53RhzBnE$RJrfk2JC7P/kkgYeoNm7HhQzXT3C2REV5cECMiS9cg8=	\N	8038a58d-9d07-18e9-7a7c-524261a2803d	t	e146f0e52d9c4b8eb61d3afab4c1af1e	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:8038a58d9d0718e97a7c524261a2803d	Combid51	Mudj Gashtor K	2018-05-23 14:26:19.327848(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$vyQlNLKcc2MN$4uKuDU8w3P40jyuD2AoCcEwhd1NNoFgwQhfRw9ZC0NY=	\N	ce9c4739-6533-4d65-7521-498896f2fc04	t	6ea863b3896c4a38b89bfaa91ac903c8	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:ce9c473965334d657521498896f2fc04	Coldingaze1972	Najjar T 'Azizah	2018-05-23 14:26:19.390068(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$szpZcUiZxAFf$tb3Mx6H28HLmdaAcaNpc01uGrAAD1hiDwP4K937XDZk=	\N	9d1ce897-94c9-e57f-d540-a2b4935ce6ea	t	403a2f05b30242dc8ac8a618a6600fd0	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:9d1ce89794c9e57fd540a2b4935ce6ea	Spedity	Mới Đào N	2018-05-23 14:26:19.431899(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$y5xFQqg3L9r5$YUc48x+E4oe0nIUvbIFnpIIkxxYqYQ8IyfnPHxUqAXk=	\N	c2f6c0e6-b261-f064-aeec-5ab291d7d0e3	t	ea328ff99e854f0c869f6c76e8181669	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:c2f6c0e6b261f064aeec5ab291d7d0e3	Froment	Frederiksen August K	2018-05-23 14:26:19.460089(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$PfoF4vJBNvbc$8JGjZGfsWKAhoyYLfJYdd+CZlD9x//Vw0j1KDL6ZJLg=	\N	e553e9c1-e5e7-7c37-db9d-b1d73582b462	t	4910705050114fd3a48df6600b725757	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:e553e9c1e5e77c37db9db1d73582b462	Unothouldits1938	Ага́пов О Трофим	2018-05-23 14:26:19.492036(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$Tt5s4QbjgU5m$k1UD/kKN3xi35pVgnhFGW34FOU6e168fGJGatk2FeEE=	\N	0007b342-da92-98f1-6d54-f97c6ea4d93e	t	d66fcec79de94425ac6274bd65da09b1	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:0007b342da9298f16d54f97c6ea4d93e	Whounces	M Peter Eriksen	2018-05-23 14:26:19.523328(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$mtctlLN1d2Yk$npI+szQilNITJnupPNR3XgTHgXk5TsrHwXKiiITTf9Y=	\N	a7bec8fd-3572-0b4b-df02-c7a2c2e76ac3	t	1e61009afd7349709be4a7235d1164fa	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:a7bec8fd35720b4bdf02c7a2c2e76ac3	Beffspinget	Ingrid	2018-05-23 14:26:19.574667(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$wX6gco9QJaH9$dgqaXgY5KIT32COK24DsH6h7XPSfA7DkRDSHPoykC6U=	\N	01ead467-7c99-807c-2133-08e9d814c3e8	t	ca370d911c134ae88c6c82e75772adf7	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:01ead4677c99807c213308e9d814c3e8	Dessad91	M Tunnelly	2018-05-23 14:26:19.604674(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$SqF49LtgFVpC$3OVsyySm/SegVdMphJ2H+KrJ38Aq9aP2zozOYYsxNRA=	\N	cb3eaf98-9e14-8b19-4121-02e6dfada633	t	d62b583e6ddb497fb5ecafe650212ffa	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:cb3eaf989e148b19412102e6dfada633	Theareesum	S	2018-05-23 14:26:19.633600(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$UXA68rudhv1r$q7GBCEpSj00TgU1ZEkkkJo6F9V5vl0XZJ3GXvpwPshQ=	\N	55ed0860-7ac7-e4f0-5bfa-b9f01f0cb06e	t	367ce7afa8354485a74df951940c27de	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:55ed08607ac7e4f05bfab9f01f0cb06e	Lourth84	Albracca	2018-05-23 14:26:19.662060(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$UyBvpTjMEnkQ$Df2uBASWmYnd0KM/EqlzPeZOQnqR1yAvAJoSVU+pD7M=	\N	5b9dfda2-fc8b-0f81-fd2d-8ad627045432	t	7f5840759c244399bd563ae5a95c5d18	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:5b9dfda2fc8b0f81fd2d8ad627045432	Teare1985	C King	2018-05-23 14:26:19.730151(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$LUeIlmtjKwFN$usoD+VM4IzUCU4+bebHhZCKuM8Nd8cSghwxAN+2k9Jo=	\N	fab1053f-3f26-5dc0-e349-99e9a97280b1	t	72dedd4aeef84249876ee7854483d377	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:fab1053f3f265dc0e34999e9a97280b1	Bections	Sofia	2018-05-23 14:26:19.771424(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$DcEl7MfW6zRV$K57pTNbNtikwWsxGsApb3IaiJkl3hJMSFuiggWu1ztg=	\N	d3c7ea73-a947-4895-9c0c-99a044531e94	t	d57d9837ff564859a8ae8819394ca4aa	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:d3c7ea73a94748959c0c99a044531e94	Pretrusiona	O Hansen	2018-05-23 14:26:19.800198(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$pUoLOSOMEI2p$EdoRnNmHvdkWSuUNzkDnRQj9PzuOTfJ5Pv4l3WJtbMc=	\N	643d8990-3eaa-af46-1ed0-27dc810005d7	t	cf10cb12b8af48d9a38a57f540910420	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:643d89903eaaaf461ed027dc810005d7	Againgly	Kalebić Z	2018-05-23 14:26:19.841010(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$ihLu9Dx6Ry3C$T/nBUj9k5ksW94OHlSKaxxxA0nnB0opAtO4Ol/mbnzk=	\N	c7dad8b2-72be-7ed1-00d4-7b93fbe7be23	t	c6484f54b49f4a50934d98cf47d47011	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:c7dad8b272be7ed100d47b93fbe7be23	Iling1932	O	2018-05-23 14:26:19.869658(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$Gewq6FYrX51D$JzI7v17YwgDHXk+BR1AGtC566E4NZc+WiTV9CWa5C3g=	\N	eff8be7e-8d14-60ca-a422-a005a7e21a59	t	2b3448c9f2ca4ad28a36a2a43b391b1c	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:eff8be7e8d1460caa422a005a7e21a59	Woution	August Jørgensen	2018-05-23 14:26:19.899631(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$baH0g1aGR7Zn$1AM9Tfe/40APRfsVxQI42316eyxV4ruL9cSU6fsNo4U=	\N	68a187bf-7e12-d4a7-7367-658ac1687cbd	t	bdcfd85f63b141ada3fc498997416256	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:68a187bf7e12d4a77367658ac1687cbd	Junted	กัณทะเชียร ก	2018-05-23 14:26:19.931366(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$kdHy8E8QR5o6$0xPfgUNAVi4x/Q8rAxJ3BEGbXhjBjusfqiK1IahG57Q=	\N	4a409cf1-4029-0cd5-70a0-c0b82a26d110	t	fd20616df65d41b198179bbf6baf16e1	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:4a409cf140290cd570a0c0b82a26d110	Chicelf	H	2018-05-23 14:26:19.960692(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
pbkdf2_sha256$36000$z69DUPmof3gU$kQh6fR/pT9jrMcx5v5CqHDnFyeuJ7OREOjhqiapFUPo=	\N	f5739205-d8b3-34f5-6b1f-00f778642503	t	64f97a03fd7d49ada0de03162c338318	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:f5739205d8b334f56b1f00f778642503	Wisess	K'trelan	2018-05-23 14:26:19.989359(Europe/Paris)	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79838efd-4f2e-5c61-4e07-07540c4b9ae0
\.


--
-- Data for Name: kolibriauth_membership; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kolibriauth_membership (id, _morango_dirty_bit, _morango_source_id, _morango_partition, collection_id, dataset_id, user_id) FROM stdin;
f1719de5-a2eb-0804-b3e6-e172ab283da1	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:342a6528840f1c1ae6c6f588c826550b	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	342a6528-840f-1c1a-e6c6-f588c826550b
f7d15703-6adb-8ecf-bae3-e696fe99ad5e	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:c940785be15b9246003bdf3fa714e081	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	c940785b-e15b-9246-003b-df3fa714e081
39e5b835-7eb5-f1ec-05fc-ed52113c7870	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:dabfd9cd5868692a163142239bd57c0c	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	dabfd9cd-5868-692a-1631-42239bd57c0c
46bd2130-7363-e242-291c-fae0b06808d0	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:e882668beedf4a5c56f4cfa1e5d4c42c	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	e882668b-eedf-4a5c-56f4-cfa1e5d4c42c
f8df03f4-6b72-49ff-f2b9-c495a45f650a	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:be6901b9f527c56eba71dfe8c337fbcd	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	be6901b9-f527-c56e-ba71-dfe8c337fbcd
1bc467e3-71ed-9e2d-8988-f370a3f5eb16	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:2bcda18cd4466ac5a9d8073c85fcc082	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	2bcda18c-d446-6ac5-a9d8-073c85fcc082
7cbfc201-1fa3-6e44-4551-590ac9c8ee2a	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:179957310e5a1b1bad60a4483c7c0b73	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	17995731-0e5a-1b1b-ad60-a4483c7c0b73
371eaaf3-687e-352d-439e-e1ce088c4044	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:99909c93fee30d21cdf1af0ee2cb6287	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	99909c93-fee3-0d21-cdf1-af0ee2cb6287
8f5937ac-a0fe-d6e9-734e-f6fed29d8f8a	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:4656efa63d071952cc77c308c7572496	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	4656efa6-3d07-1952-cc77-c308c7572496
be536518-b47a-e9f0-89cc-1dcd6bb2ad06	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:91f1c49e77666aa203166f90ca331c78	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	91f1c49e-7766-6aa2-0316-6f90ca331c78
08c01beb-d747-6acf-9535-713b43429739	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:0da91db45ab465c139951d45593e2eb4	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	0da91db4-5ab4-65c1-3995-1d45593e2eb4
d7c23005-a0d4-5c54-1b86-4913b73a9ab7	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:c5e61c55de1d738217f58aefea34c13a	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	c5e61c55-de1d-7382-17f5-8aefea34c13a
439e81c0-0198-ef0e-1567-1ca6dffb9275	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:79c7dd1276df675b9cbc20cc0b4306ba	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	79c7dd12-76df-675b-9cbc-20cc0b4306ba
7742d782-a476-c4c2-d997-7e151654c252	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:4972ecffbd52eb563732f58cd2da7ab6	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	4972ecff-bd52-eb56-3732-f58cd2da7ab6
bfa2f131-eba4-1eb3-db33-195b3e2a15c3	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:9791e2fa3a05bc034ed7c3056be534e8	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	9791e2fa-3a05-bc03-4ed7-c3056be534e8
211da84e-8d3d-07ed-f00f-50f174167d44	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:b74d32f74abf1d6402dba8bfbd94180a	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	b74d32f7-4abf-1d64-02db-a8bfbd94180a
1aabb53c-38e4-53c3-171a-aea47cdcf3ec	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:327fc49d51f1043f44549df6f36f11e1	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	327fc49d-51f1-043f-4454-9df6f36f11e1
a073fa34-ef54-8a02-6f72-7af1c8a1703e	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:acd1a00090f6d5f00a043b25a94270e1	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	acd1a000-90f6-d5f0-0a04-3b25a94270e1
21797437-9a13-2854-9e97-2cde865b8542	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:c2e9c7fd6c3d5f6dd60beecfff98d60d	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	c2e9c7fd-6c3d-5f6d-d60b-eecfff98d60d
1fa4962c-ff2d-7e0d-e0dc-f61771cd5714	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:2f623cca974a0c00bcd32502b410ac88	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	2f623cca-974a-0c00-bcd3-2502b410ac88
d8d31983-2025-93c8-46ee-b9498274ba19	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:db83e0f77c6039d49fe865393f77cb6f	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	db83e0f7-7c60-39d4-9fe8-65393f77cb6f
ddbf7855-ddbf-1aba-d65e-409b9f52e949	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:4f6942619a93b2c6f34dff735b935fab	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	4f694261-9a93-b2c6-f34d-ff735b935fab
76c8d154-0c09-e0f8-f2db-cb701710858a	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:1c1bd7ca318e33f30097835da12ac0de	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	1c1bd7ca-318e-33f3-0097-835da12ac0de
bf66f380-9005-244a-b2cc-6e334205461a	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:943ff6a724a3e9527922e5a10ece0167	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	943ff6a7-24a3-e952-7922-e5a10ece0167
95b69a84-5b4c-45d5-7817-9a3be4db24cf	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:af7d98e32886cec29f2cc658ef11084b	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	af7d98e3-2886-cec2-9f2c-c658ef11084b
1a29d9be-cb51-a948-25bb-350d1e937b31	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:80b69ac6174ef1dabd1af7bffe5b8715	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	80b69ac6-174e-f1da-bd1a-f7bffe5b8715
65a94656-d279-6918-bb6f-9f7217dbc210	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:d4b5f5aa678492893eae301a3b5a9874	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	d4b5f5aa-6784-9289-3eae-301a3b5a9874
0726030b-3f96-584d-e1bb-e591d89533fc	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:fd6e80877197aeb246512e2d2d8e0da8	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	fd6e8087-7197-aeb2-4651-2e2d2d8e0da8
2e06cc2e-3593-81c7-b380-63e2129f5400	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:91d5fd3bbe70baf821a7bee551265d39	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	91d5fd3b-be70-baf8-21a7-bee551265d39
64344653-05a9-2cbb-ed77-876a0f5ea88b	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:2d263f54c00626dd2531955763c05344	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	2d263f54-c006-26dd-2531-955763c05344
711b8f10-f481-e520-815e-f4274e8c229c	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:6ca0c2aa76add18734764856a5cb72ea	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	6ca0c2aa-76ad-d187-3476-4856a5cb72ea
56e56ce7-c382-2857-e069-4727ba24ddbe	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:83599af28976f401d0f049bc9ed4734c	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	83599af2-8976-f401-d0f0-49bc9ed4734c
ff15678a-cbb9-6a28-bf18-e3650f400665	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:2e25fd3ddea615b4281c58042b4bc576	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	2e25fd3d-dea6-15b4-281c-58042b4bc576
00d21456-1af9-fb12-1169-68a2c4a515dc	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:a02240dfffbc8da794201eb3038f24a3	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	a02240df-ffbc-8da7-9420-1eb3038f24a3
41039c0a-0db2-cc3c-adf5-29b2c2489bdb	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:3d5bde2d0c1366f21a06e0791d8451ec	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	3d5bde2d-0c13-66f2-1a06-e0791d8451ec
e909c14a-6a2f-d03f-0af6-033452b7de9b	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:775d5b12f8a19f8334f2f0f7ea1e8d54	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	775d5b12-f8a1-9f83-34f2-f0f7ea1e8d54
f3888f14-9c00-2bbb-ae0e-0e9c3f6f801b	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:2d7b348716648fa3f6ef5b46a902452f	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	2d7b3487-1664-8fa3-f6ef-5b46a902452f
ced1175b-a4d9-6c2e-d2af-897a673401d3	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:d6378b1e12cece17831b3bb41c806d47	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	d6378b1e-12ce-ce17-831b-3bb41c806d47
7afdf6f9-6721-b149-38bc-07b249a3e99f	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:4b706273239e83223bf53ed36791ede7	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	4b706273-239e-8322-3bf5-3ed36791ede7
d093130d-32a6-9aef-6ee1-cbedfc2955cf	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:e47f3e2a0d6d2348bae6fa9e68df6bbc	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	e47f3e2a-0d6d-2348-bae6-fa9e68df6bbc
90a44eac-1dff-59a9-8de8-13f09938b4b6	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:1562c30296f2eddd13682151250fb247	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	1562c302-96f2-eddd-1368-2151250fb247
7d084087-7d02-c454-5b8e-b399ac013960	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:b2b5a41ae8c793225beabd457b292d8e	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	b2b5a41a-e8c7-9322-5bea-bd457b292d8e
e017b582-065c-11d8-b34d-a8613f746283	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:fbf7b73d0ac7bd900fef24d0cda56e57	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	fbf7b73d-0ac7-bd90-0fef-24d0cda56e57
2e5c0891-a19c-de63-28b7-fcf6e12eb1b4	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:c08fcfbd1d36b505214b2ada8ec56c35	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	c08fcfbd-1d36-b505-214b-2ada8ec56c35
b8fc00e9-ce1b-ef02-b9be-5da393563984	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:1baf4851dd79b79eee63f0ac74da4f22	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	1baf4851-dd79-b79e-ee63-f0ac74da4f22
a23c44d7-82de-9532-59c6-bd34a07e61b9	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:6c32b718db334daf5ab799b4673a0736	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	6c32b718-db33-4daf-5ab7-99b4673a0736
89e474fe-ba1e-afbd-5063-68ca6cfb84f8	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:535d0f4a7c73d6c31a31cf8d78e58fe1	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	535d0f4a-7c73-d6c3-1a31-cf8d78e58fe1
a307d037-7460-800d-e5f8-9d498cf21e3c	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:02c5ba516c8e82f08c410a080f7befb0	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	02c5ba51-6c8e-82f0-8c41-0a080f7befb0
678f3d45-2138-a5ee-7c9f-355cb6f0a4e3	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:1bb6f92b631883ed2da5d15e5326c625	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	1bb6f92b-6318-83ed-2da5-d15e5326c625
32e9988a-cc47-7e81-28d1-0639be84d312	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:cdd1381209754c4102af1954077ea377	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	cdd13812-0975-4c41-02af-1954077ea377
195156d5-a54b-d49f-e01a-e8c252124a6d	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:9e1bf5501b54973591f8e261cd03f753	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	9e1bf550-1b54-9735-91f8-e261cd03f753
033f55d8-7fa5-d141-f2ec-6e2bcb6e1019	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:20a93c32037041f461d632e1028cdce1	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	20a93c32-0370-41f4-61d6-32e1028cdce1
e3ddb054-660a-16df-fd9b-67cd74bb9d40	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:b9ec95912c88cef2c8f3c0e1660e021a	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	b9ec9591-2c88-cef2-c8f3-c0e1660e021a
ec46eca3-4a72-b820-0982-f81d0868bd41	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:18ee6ab383dd376f75fd4707648c7570	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	18ee6ab3-83dd-376f-75fd-4707648c7570
aa467acb-585a-59b1-8a33-05ce98e1d8c1	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:f77e8a7191abd82511cd701a4b561fed	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	f77e8a71-91ab-d825-11cd-701a4b561fed
7cac698a-9e4b-23b6-2051-c5ef611a516c	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:37ff65cbc333bcce41625072815e6121	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	37ff65cb-c333-bcce-4162-5072815e6121
dc8886d3-dbd7-3112-f6c9-ceab9154fc8d	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:753fe5ba73d4fd776ad3bdf3e87cb6f4	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	753fe5ba-73d4-fd77-6ad3-bdf3e87cb6f4
5f7d8b1c-5c57-8b6a-d358-e845624fa819	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:a7e50f25634305167271678dc745faa3	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	a7e50f25-6343-0516-7271-678dc745faa3
68d61e20-bb47-5e6f-17d1-9a4506930151	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:e2e4b77f635dc1710f74df3ded63ce89	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	e2e4b77f-635d-c171-0f74-df3ded63ce89
ca14ce47-e7e2-c06a-906c-45e8ce375f64	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:045e5aadab6cd9d45acfb96bd968a613	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	045e5aad-ab6c-d9d4-5acf-b96bd968a613
e40869e5-d8f1-e9ba-0338-5eaa3f7e1a58	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:e0a3ebaf934dba2fbaace8bb6f9e3120	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	e0a3ebaf-934d-ba2f-baac-e8bb6f9e3120
e3d89af3-cc8a-0eea-b223-fbf7bf5876f4	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:92862228911feb24e2909224bf46ec35	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	92862228-911f-eb24-e290-9224bf46ec35
1b9e4a4d-ec10-97d5-96ca-eac5ee781fe0	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:3972d7fd0b6d126d2106917295d041f1	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	3972d7fd-0b6d-126d-2106-917295d041f1
3872ee64-967f-cc71-7232-c11adeb1288f	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:13dfcb225871f8671e58ddfe992fa5c9	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	13dfcb22-5871-f867-1e58-ddfe992fa5c9
3320c2d0-d9b7-db07-0601-1066d67b265a	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:2dc72fa830334a0d76b1d6a7b023f981	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	2dc72fa8-3033-4a0d-76b1-d6a7b023f981
4c1f281e-22c2-44ac-63bd-c14292899be5	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:d71ebb6ba8d352adcb07f0fe664ef343	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	d71ebb6b-a8d3-52ad-cb07-f0fe664ef343
dbade2ef-caf1-e04b-3cdf-aa6fe6dbda32	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:e90b4db5bc7fa51b8384a2f15e869442	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	e90b4db5-bc7f-a51b-8384-a2f15e869442
ef865ae7-a30c-2c70-0a10-ea48b40db2f2	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:c679ccef2ce24eea6a7cfd8800d7e641	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	c679ccef-2ce2-4eea-6a7c-fd8800d7e641
f48bd72a-5aa8-30c8-b2c1-8b0d896f49c2	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:1eea752087aabdb50698ed01c3b91c4c	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	1eea7520-87aa-bdb5-0698-ed01c3b91c4c
6c6b0e39-6a97-6b50-6ed2-9459ffac600a	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:306e93831d09c035f966cb6e4eedcece	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	306e9383-1d09-c035-f966-cb6e4eedcece
89060b1a-a03f-2811-dea8-aedc57a9ac07	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:21cc5afa3ff792d103c361c30fb95032	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	21cc5afa-3ff7-92d1-03c3-61c30fb95032
d2fc97cb-5f25-712f-43dc-ad151e126e38	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:c43c4f554be4cec25b79abeeb789bf84	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	c43c4f55-4be4-cec2-5b79-abeeb789bf84
50fee0dd-da70-6bc0-13b4-c236bf4489ab	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:c956862258c916d10247632252f92a0d	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	c9568622-58c9-16d1-0247-632252f92a0d
1118c2a9-c4e3-ade6-ced0-9cd356158d8d	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:04f2c83d180a610e2161df8c2985a669	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	04f2c83d-180a-610e-2161-df8c2985a669
6d414098-a9e1-22d6-1bff-5c8d067513a2	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:c88b6ebba69c5b19a2bffd431b66b868	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	c88b6ebb-a69c-5b19-a2bf-fd431b66b868
9220ab67-f7f5-92e0-1075-9f708c359c5b	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:3b5c809f9d3ce11bf2d50c978a9cb7a7	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	3b5c809f-9d3c-e11b-f2d5-0c978a9cb7a7
ed015138-94ee-3e7e-b071-2d8a515908c5	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:007ba9cb46b98a91478b66f2ddfe7b98	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	007ba9cb-46b9-8a91-478b-66f2ddfe7b98
17441742-0642-31be-1acb-e133f23118d4	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:61404ee709f6950df096aed8bf33ad49	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	61404ee7-09f6-950d-f096-aed8bf33ad49
4767e725-eb9f-8f6a-c078-e8b90580ed1d	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:1e1060a98ed426b8fa3bc6a265c5292a	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	1e1060a9-8ed4-26b8-fa3b-c6a265c5292a
d71e2223-2dd3-5502-ec39-250606ddb3f8	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:19c45401727034b18cae5ff8482b4ab4	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	19c45401-7270-34b1-8cae-5ff8482b4ab4
bf155836-a8ed-cac2-6bce-2ac828751929	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:8038a58d9d0718e97a7c524261a2803d	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	8038a58d-9d07-18e9-7a7c-524261a2803d
bbcd5377-1e7c-6371-acf6-9f80c2a41e90	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:ce9c473965334d657521498896f2fc04	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	ce9c4739-6533-4d65-7521-498896f2fc04
b34debae-0047-025a-4324-ed1bedc42276	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:9d1ce89794c9e57fd540a2b4935ce6ea	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	9d1ce897-94c9-e57f-d540-a2b4935ce6ea
06cfcfb6-6bbf-4755-2095-44198f10bbf5	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:c2f6c0e6b261f064aeec5ab291d7d0e3	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	c2f6c0e6-b261-f064-aeec-5ab291d7d0e3
f2fc5dd5-6f24-1123-c957-db256daa68c8	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:e553e9c1e5e77c37db9db1d73582b462	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	e553e9c1-e5e7-7c37-db9d-b1d73582b462
23d6427c-a447-ce99-93bf-b059849ae9b2	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:0007b342da9298f16d54f97c6ea4d93e	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	0007b342-da92-98f1-6d54-f97c6ea4d93e
9e5ffd5e-c758-bd1e-7295-c0e0e209687b	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:a7bec8fd35720b4bdf02c7a2c2e76ac3	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	a7bec8fd-3572-0b4b-df02-c7a2c2e76ac3
88c580a6-07a3-de1b-f965-acfe257c9fc0	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:01ead4677c99807c213308e9d814c3e8	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	01ead467-7c99-807c-2133-08e9d814c3e8
ec3798da-faa9-badb-b715-8cf5bd843446	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:cb3eaf989e148b19412102e6dfada633	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	cb3eaf98-9e14-8b19-4121-02e6dfada633
b5ef40aa-c6a0-a826-4049-28178b7d5d80	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:55ed08607ac7e4f05bfab9f01f0cb06e	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	55ed0860-7ac7-e4f0-5bfa-b9f01f0cb06e
a1da2194-b371-c777-0dd0-1d50198496ba	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:f310c74c11bd0e03d5937f312d6f6430	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	f310c74c-11bd-0e03-d593-7f312d6f6430
4f67d0b2-254d-1d2e-4725-e9ac9e3181b4	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:5b9dfda2fc8b0f81fd2d8ad627045432	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	5b9dfda2-fc8b-0f81-fd2d-8ad627045432
7c49d334-5b81-5002-466c-853481a9b556	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:fab1053f3f265dc0e34999e9a97280b1	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	fab1053f-3f26-5dc0-e349-99e9a97280b1
96d2ebd4-4061-d936-502d-b5ae9a622ab8	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:d3c7ea73a94748959c0c99a044531e94	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	d3c7ea73-a947-4895-9c0c-99a044531e94
2c6e3960-2b84-03d6-6899-d40216de22c3	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:643d89903eaaaf461ed027dc810005d7	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	643d8990-3eaa-af46-1ed0-27dc810005d7
34cea7ba-343a-fa25-60ee-016c176a6d6c	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:c7dad8b272be7ed100d47b93fbe7be23	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	c7dad8b2-72be-7ed1-00d4-7b93fbe7be23
51b89098-d4e7-954e-5e48-c09e7467247d	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:eff8be7e8d1460caa422a005a7e21a59	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	eff8be7e-8d14-60ca-a422-a005a7e21a59
4a7caf35-dd60-becb-2e47-4fc544a69a34	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:68a187bf7e12d4a77367658ac1687cbd	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	68a187bf-7e12-d4a7-7367-658ac1687cbd
5e67a91d-128d-db64-83cd-5963a861f4ec	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:4a409cf140290cd570a0c0b82a26d110	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	4a409cf1-4029-0cd5-70a0-c0b82a26d110
75799dbe-9f02-c259-3980-cdec00860b08	t	6831d49d65fe113cc8df23bb874f17e6	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:f5739205d8b334f56b1f00f778642503	6831d49d-65fe-113c-c8df-23bb874f17e6	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	f5739205-d8b3-34f5-6b1f-00f778642503
\.


--
-- Data for Name: kolibriauth_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kolibriauth_role (id, _morango_dirty_bit, _morango_source_id, _morango_partition, kind, collection_id, dataset_id, user_id) FROM stdin;
6bd68583-f08b-7544-4603-d9466b6cc740	t	79838efd4f2e5c614e0707540c4b9ae0:admin	ed957d6aedcd6b783fa0e8cbef55d2bd:user-ro:774e91f2618979e1f81000b50b69969e	admin	79838efd-4f2e-5c61-4e07-07540c4b9ae0	ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	774e91f2-6189-79e1-f810-00b50b69969e
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
250711c7-a1fe-d1db-7410-7038571f17b1	t	7c68485e3d614d19bb8f37f7fd2ae58b	ed957d6aedcd6b783fa0e8cbef55d2bd:user-rw:774e91f2618979e1f81000b50b69969e		2018-05-23 14:26:02.535403(Europe/Paris)	2018-05-23 14:26:02.640933(Europe/Paris)		ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	774e91f2-6189-79e1-f810-00b50b69969e
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
ed957d6a-edcd-6b78-3fa0-e8cbef55d2bd	facilitydata	1	{"dataset_id": "ed957d6aedcd6b783fa0e8cbef55d2bd"}	MIIBCgKCAQEA2CxZi6n06Re57iRGVhXT16kb8SkeBffmskGnuicWL9pdZqQyxnzIjZLtL2+iLEi/e0jLzOd5IY3WNY3ERsspMmWpx88AT2PxUEp7wNpZFJzLxN4AGfY0jtSs3aSks6UJl+KH/bX6PnfpwGCoRPKoz1vknZdW0nvyAYHXL/6ctC/HITP3nY9BmJQ88pRUfMCbM0IC5DwvwD64/TmHv24ejyOcSvDISn4oN1F8KD/3SiRg4UP6603ePIZ/4iR+rmLeM0fG5zH8h2kBN2LIVsumKZiJFSf5lj18tIDcxqVwuDcz/s8kwfquAJsZX4pF1NCeNHrs/XjUYlhr9eKLEVNneQIDAQAB	{"profile": "facilitydata", "parent_id": null, "scope_version": 1, "scope_params": "{\\"dataset_id\\": \\"ed957d6aedcd6b783fa0e8cbef55d2bd\\"}", "public_key_string": "MIIBCgKCAQEA2CxZi6n06Re57iRGVhXT16kb8SkeBffmskGnuicWL9pdZqQyxnzIjZLtL2+iLEi/e0jLzOd5IY3WNY3ERsspMmWpx88AT2PxUEp7wNpZFJzLxN4AGfY0jtSs3aSks6UJl+KH/bX6PnfpwGCoRPKoz1vknZdW0nvyAYHXL/6ctC/HITP3nY9BmJQ88pRUfMCbM0IC5DwvwD64/TmHv24ejyOcSvDISn4oN1F8KD/3SiRg4UP6603ePIZ/4iR+rmLeM0fG5zH8h2kBN2LIVsumKZiJFSf5lj18tIDcxqVwuDcz/s8kwfquAJsZX4pF1NCeNHrs/XjUYlhr9eKLEVNneQIDAQAB", "salt": "", "id": "ed957d6aedcd6b783fa0e8cbef55d2bd", "scope_definition_id": "full-facility"}	Vdk1wZzfs6l7P6FEZnPDNZ9KytiNgxmFmMSfAegUhO723X9mZ1WuNpL7GtsfxjhXLBRkr7ZAjtTczkIrDy5Jsx/qX28FfMai699WxClslCWj3cdcfSnsmdhn4eyvnfdnYllqrM49EFPMYR7O1SyXh2fcshyN5PGIUlmPKL8UTX2AFfZTAMZdk4RpBhEE0Y1zYQ9Ze0hAEZ/FE1Pe14ZGMG6bTzFTbUR196skkHyk+jx1Q5d5Az5GaXxu8Z+waWp1EIMSUQ5OK6LWnjjMCX4HVopWFNqjI56SZ3eLM4OA0FuvO6nLaAXEWQMP0yoMXJe48OQ9lN+MmjCp5vCvsjs4fg==	-----BEGIN RSA PRIVATE KEY-----\nMIIEpAIBAAKCAQEA2CxZi6n06Re57iRGVhXT16kb8SkeBffmskGnuicWL9pdZqQy\nxnzIjZLtL2+iLEi/e0jLzOd5IY3WNY3ERsspMmWpx88AT2PxUEp7wNpZFJzLxN4A\nGfY0jtSs3aSks6UJl+KH/bX6PnfpwGCoRPKoz1vknZdW0nvyAYHXL/6ctC/HITP3\nnY9BmJQ88pRUfMCbM0IC5DwvwD64/TmHv24ejyOcSvDISn4oN1F8KD/3SiRg4UP6\n603ePIZ/4iR+rmLeM0fG5zH8h2kBN2LIVsumKZiJFSf5lj18tIDcxqVwuDcz/s8k\nwfquAJsZX4pF1NCeNHrs/XjUYlhr9eKLEVNneQIDAQABAoIBAQDI8okW3Bku6IBM\nz+mWMlonWisARaGEGMqZn5CD6bulJg620CHnAq4HdLII63PMSJ++wY+5XN7sAwZB\n6BOxXz9fesOVWmZGZng2k9ZwEkjGcW62BUwA1i5LK4W5z0fPOrYtO0YA4T3K/fsL\neo5Q8WVcxGZC3CC4LsFrB0B6e+s9Top89D3c2wdwl3T1BODcVe5no5K5890RaVuA\nyIQ1kGXJnysb0GmF8DfPPdmWxB7T7FwoYImTs0HTRru6yqrOmy+xrWZ4mmExQkTk\nvllxfeF7ZJYVAb0dayKa9kPbTg3/Mg21TjAxujDrXfnHQrMuj4uymDccJMi5/BcP\newsC3QxFAoGBAPicxLSkNYYx8OwnLhRsn+6PaJYVfCWrriS0UgxHV47NuDAYn7j1\nC/y0cPgqZbG85DCaGEDVi1xWZVxUwFIe+hzyD921W50lFKaoatJlGt3ZXCayHgaQ\nnws7XMVnn0dot6zqHsYJ86Yhzo8tEy4oezAqOgfCg30qjj7EVT6m+7z7AoGBAN6Y\nz+H6shb1kh44MJ5Ylh8p1MjISOU1msYnzKwq6bB6S0KqqQOTHA9vRWoZeHBJns3d\nTG/NZ0fLG3DS3S95sDC/RB8s97wDj3TfU1cWECi6CaQl8tUrS2IY2mg4/ZvTrDwh\nKD42FifjcVxVbwBe/4yUrnjnyiJ034ggQE8ACBsbAoGAUrSEU7vU+oGerlESaUUB\np3EZz+Px2u5UDm3WZbNOE3moboeiivsqM7UrZ8Ni9U/rcaexrc/cfqlXKvIe0LLx\nbbOxR4ZPpeVyC0c30ipEV805dL4IcxKldi0XXaxtNmpFwEZaWnNxFLFmcAcEvHRH\nFuzVRUOWTotbqtHRsfgHAwUCgYBMGwUgZz1Sej2uFVoSGYmiOAQnbcr2iyBS1bK1\nvqpNi1KGBaFptndmk42xG+pAwfsIubvzkc/ZDQlhxsaW/80MrahV3GMLJlB7DgwJ\nf2Kg+hJnzA29cmMAtCyga7PR/kop+NAwjP+APdQ5VIByKQjIgOEyN1W1+C2g9h3m\npMUgtwKBgQDORJfV50aYnLgGzxcxqnIf4VW2y+ScgW60BhVGh7i1wxFrOJ/hzNVU\nnQb872g46I2M979LAzsp64pep3XJhoy2wM+L7XkBczm4tmJ0c7t6CRS5UBaVGFH+\nWmt6VAF7AJ7VHufK3qlcf4NkYrTD9JQyfHsMq78SBKVpy2BAQCDhjw==\n-----END RSA PRIVATE KEY-----\n	1	2	1	0	\N	full-facility	
\.


--
-- Data for Name: morango_databaseidmodel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.morango_databaseidmodel (id, current, date_generated, initial_instance_id) FROM stdin;
e7fb0ad6-46b6-4677-af00-a080011b56b1	t	2018-05-23 16:25:48.2123+02	
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
65f2f8b1-d8f8-da07-6a61-f95b8a6cb65d	Linux-4.14.0-041400-generic-x86_64-with-Ubuntu-17.10-artful	t470s	2.7.14 (default, Sep 23 2017, 22:06:14) \n[GCC 7.2.0]	6741994bc329b284062e	0	t	/home/boni/projects/learning-equality/kolibri/velox	e7fb0ad6-46b6-4677-af00-a080011b56b1	
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

