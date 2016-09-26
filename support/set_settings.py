#Python script takes local settings as first argument and template settings as the second argument. Copys local settings into template settings

import sys, os

local_settings    = sys.argv[1]
template_settings = sys.argv[2]

with open(template_settings) as TF:
    template = TF.read()
    TF.close()
    with open(local_settings) as LS:
        for line in LS:
            if "=" in line:
                var, val = line.split("=", 1)
                var = var.strip()
                val = val.strip()
                val = val.strip('"')
                val = val.strip("'")

                template = template.replace("["+var+"]", val)
        LS.close()
    writedir = os.path.dirname(template_settings)
    with open (os.path.join(writedir, "settings.py"), 'w') as OUT:
        OUT.write(template)
        OUT.close()
        print "SUCCESS! Settings created: "+os.path.join(writedir, "settings.py")
