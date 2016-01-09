package Mdiag;

use Modern::Perl;
use XML::Rabbit::Root;

has_xpath_value account            => '//Data/job/@Account';
has_xpath_value block_reason       => '//Data/job/@BlockReason';
has_xpath_value class              => '//Data/job/@Class';
has_xpath_value drm_jid            => '//Data/job/@DRMJID';
has_xpath_value ee_duration        => '//Data/job/@EEDuration';
has_xpath_value e_state            => '//Data/job/@EState';
has_xpath_value eff_pal            => '//Data/job/@EffPAL';
has_xpath_value flags              => '//Data/job/@Flags';
has_xpath_value g_attr             => '//Data/job/@GAttr';
has_xpath_value group              => '//Data/job/@Group';
has_xpath_value job_id             => '//Data/job/@JobID';
has_xpath_value job_name           => '//Data/job/@JobName';
has_xpath_value o_file             => '//Data/job/@OFile';
has_xpath_value pal                => '//Data/job/@PAL';
has_xpath_value qos                => '//Data/job/@QOS';
has_xpath_value qos_req            => '//Data/job/@QOSReq';
has_xpath_value queue_status       => '//Data/job/@QueueStatus';
has_xpath_value rm                 => '//Data/job/@RM';
has_xpath_value rm_std_err         => '//Data/job/@RMStdErr';
has_xpath_value rm_stdout          => '//Data/job/@RMStdOut';
has_xpath_value req_aw_duration    => '//Data/job/@ReqAWDuration';
has_xpath_value srm_jid            => '//Data/job/@SRMJID';
has_xpath_value start_priority     => '//Data/job/@StartPriority';
has_xpath_value stat_ms_utl        => '//Data/job/@StatMSUtl';
has_xpath_value stat_ps_ded        => '//Data/job/@StatPSDed';
has_xpath_value stat_ps_utl        => '//Data/job/@StatPSUtl';
has_xpath_value state              => '//Data/job/@State';
has_xpath_value submission_time    => '//Data/job/@SubmissionTime';
has_xpath_value suspend_duration   => '//Data/job/@SuspendDuration';
has_xpath_value template_set_list  => '//Data/job/@TemplateSetList';
has_xpath_value umask              => '//Data/job/@UMask';
has_xpath_value user               => '//Data/job/@User';
has_xpath_value user_prio          => '//Data/job/@UserPrio';

has_xpath_value req_mem_per_task   => '//Data/job/req/@ReMemPerTask';
has_xpath_value req_node_mem       => '//Data/job/req/@ReqNodeMem';
has_xpath_value req_node_proc      => '//Data/job/req/@ReqNodeProc';
has_xpath_value req_node_swap      => '//Data/job/req/@ReqNodeSwap';
has_xpath_value req_proce_per_task => '//Data/job/req/@ReqProcPerTask';
has_xpath_value tc_req_min         => '//Data/job/req/@TCReqMin';

finalize_class();
