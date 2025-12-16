script_folder="/home/patrik/ITProjects/HomebroKafka/build/Debug/generators"
echo "echo Restoring environment" > "$script_folder/deactivate_conanrunenv-debug-x86_64.sh"
for v in OPENSSL_MODULES
do
   is_defined="true"
   value=$(printenv $v) || is_defined="" || true
   if [ -n "$value" ] || [ -n "$is_defined" ]
   then
       echo export "$v='$value'" >> "$script_folder/deactivate_conanrunenv-debug-x86_64.sh"
   else
       echo unset $v >> "$script_folder/deactivate_conanrunenv-debug-x86_64.sh"
   fi
done

export OPENSSL_MODULES="/home/patrik/.conan2/p/b/opense3203fa9d04c0/p/lib/ossl-modules"