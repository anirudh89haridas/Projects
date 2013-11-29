component {
    this.name="googledocs4";
    this.sessionManagement=true;

    public boolean function onApplicationStart() {
        application.clientid="583732929055-cnc3dh1liob8k3db2sl6b1mf4st5dae4.apps.googleusercontent.com";
        application.clientsecret="Bw3UsC3pp8stWlWuGZqEcLJy";
       application.callback="http://localhost/projects/OAUTH/google/callback.cfm";
       return true;
    }
        public boolean function onRequestStart() {
   
       return true;
    }

}