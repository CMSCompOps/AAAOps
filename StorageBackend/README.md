# Usage of Storage Backend 
  
  * With this script, you can print T2 & T3 sites' storage system and version.  
  * If you run like this : python checkVersion.py, you will see all storage systems.
  * If you want to be specific, i.e you want to check sites which have DPM storage system, run like this : python checkVersion.py | grep DPM 
  * Currently you can see following storage system.
	* dCache ---> python checkVersion.py | grep dCache  or python checkVersion.py | grep dcache
	* DPM   ---> python checkVersion.py | grep DPM
	* HDFS  ---> python checkVersion.py | grep HDFS
	* StoRM ---> python checkVersion.py | grep StoRM
	* BeStMan (Hadoop ?) ---> python checkVersion.py | grep BeStMan 
	* bestman (Lustre ?) ---> python checkVersion.py | grep bestman 
 


