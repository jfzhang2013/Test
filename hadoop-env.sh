# Set Hadoop-specific environment variables here.

# The only required environment variable is JAVA_HOME.  All others are
# optional.  When running a distributed configuration it is best to
# set JAVA_HOME in this file, so that it is correctly defined on
# remote nodes.


CLUSTER_NAME=XYZ

# Where log files are stored.  $HADOOP_HOME/logs by default.
 export HADOOP_LOG_DIR=/usr/local/hadoop/logs/$CLUSTER_NAME

# The directory where pid files are stored. /tmp by default.
 export HADOOP_PID_DIR=$HADOOP_LOG_DIR

# The java implementation to use.  Required.
export JAVA_HOME=${JAVA_HOME:-/usr/local/jdk1.6.0_30}

# Extra Java CLASSPATH elements.  Optional.
# export HADOOP_CLASSPATH=

# The maximum amount of heap to use, in MB. Default is 1000.
# export HADOOP_HEAPSIZE=2000

# Extra Java runtime options.  Empty by default.
 export HADOOP_OPTS=-server

# Command specific options appended to HADOOP_OPTS when specified
export HADOOP_JOBTRACKER_OPTS="-Xmx16384m -verbose:gc -XX:+PrintGCTimeStamps -XX:+PrintGCDetails -Xloggc:$HADOOP_LOG_DIR/jobtracker1.gc.log -Dcom.sun.management.jmxremote.port=8997 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -XX:ParallelGCThreads=8 -XX:+UseConcMarkSweepGC -XX:ErrorFile=$HADOOP_LOG_DIR/hs_err_pid.log -XX:NewSize=3G -XX:MaxNewSize=1G"
export HADOOP_NAMENODE_OPTS="-Xmx58392m -Xms58392m -verbose:gc -XX:+UseMembar -XX:+PrintGCDateStamps -XX:+PrintGCDetails -Xloggc:$HADOOP_LOG_DIR/namenode.gc.log -Dcom.sun.management.jmxremote.port=8998 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -XX:ParallelGCThreads=8 -XX:+UseConcMarkSweepGC -XX:ErrorFile=$HADOOP_LOG_DIR/hs_err_pid.log -XX:NewSize=5G -XX:MaxNewSize=5G"
export HADOOP_JOBTRACKER_OPTS="-Dcom.sun.management.jmxremote $HADOOP_JOBTRACKER_OPTS"

# work-around for http://bugs.sun.com/bugdatabase/view_bug.do?bug_id=6483406
export HADOOP_OPTS="$HADOOP_OPTS -Djava.net.preferIPv4Stack=true"

# export HADOOP_TASKTRACKER_OPTS=
# The following applies to multiple commands (fs, dfs, fsck, distcp etc)
# export HADOOP_CLIENT_OPTS

# Extra ssh options.  Empty by default.
# export HADOOP_SSH_OPTS="-o ConnectTimeout=1 -o SendEnv=HADOOP_CONF_DIR"
export HADOOP_SSH_OPTS="-o ConnectTimeout=1"


# File naming remote slave hosts.  $HADOOP_HOME/conf/slaves by default.
# export HADOOP_SLAVES=${HADOOP_HOME}/conf/slaves

# host:path where hadoop code should be rsync'd from.  Unset by default.
# export HADOOP_MASTER=master:/home/$USER/src/hadoop

# Seconds to sleep between slave commands.  Unset by default.  This
# can be useful in large clusters, where, e.g., slave rsyncs can
# otherwise arrive faster than the master can service them.
# export HADOOP_SLAVE_SLEEP=0.1


# A string representing this instance of hadoop. $USER by default.
# export HADOOP_IDENT_STRING=$USER

# The scheduling priority for daemon processes.  See 'man nice'.
# export HADOOP_NICENESS=10
