# audit_extended_attributes
#
# Refer to Section(s) 9.25 Page(s) 90-1  CIS Solaris 11.1 Benchmark v1.0.0
# Refer to Section(s) 9.25 Page(s) 136-7 CIS Solaris 10 Benchmark v1.1.0
#.

audit_extended_attributes () {
  if [ "$os_name" = "SunOS" ]; then
    verbose_message "Extended Attributes"
    if [ "$audit_mode" = 1 ]; then
      echo "Checking:  For files and directories with extended attributes [This might take a while]"
      for check_file in `find / \( -fstype nfs -o -fstype cachefs \
        -o -fstype autofs -o -fstype ctfs -o -fstype mntfs \
        -o -fstype objfs -o -fstype proc \) -prune \
        -o -xattr -print`; do
        total=`expr $total + 1`
        insecure=`expr $insecure + 1`
        echo "Warning:   File $check_file has extended attributes [$insecure Warnings]"
      done
    fi
  fi
}
