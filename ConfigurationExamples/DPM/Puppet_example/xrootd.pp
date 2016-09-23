# the xrootd shared key, it  has the same value as the YAIM var DPM_XROOTD_SHAREDKEY
$xrootd_sharedkey = "xxxxxx"

class{"xrootd::config":
  xrootd_user  => 'dpmmgr',
  xrootd_group => 'dpmmgr'
}
$debug = false

$cms_fed = {
 name           => 'fedredir_cms',
 fed_host       => 'xrootd-cms.infn.it',
 xrootd_port    => 1094,
 cmsd_port      => 1213,
 local_port     => 11001,
 namelib_prefix => "/dpm/<dpm_domain>/home/cms",
 namelib        => "libXrdCmsTfc.so file:/pkg/SITECONF/local/PhEDEx/storage.xml?protocol=aaa",
 paths          => [ '/store' ]
}

class{"dmlite::xrootd":
  nodetype              => [ 'head','disk' ],
  domain                => "<dpm_domain>",
  dpm_xrootd_debug      => $debug,
  dpm_xrootd_sharedkey  => "${xrootd_sharedkey}",
  dpm_xrootd_serverport => 1095,
  dpm_xrootd_fedredirs   => { "cms" => $cms_fed },
  site_name              => '<cms_site_name>',
  xrd_report            => "xrootd.t2.ucsd.edu:9931 every 60s all sync",
  xrootd_monitor        => "all fstat 60 lfn ops ssq xfr 5 ident 5m dest fstat info user redir CMS-AAA-EU-COLLECTOR.cern.ch:9330"
}

