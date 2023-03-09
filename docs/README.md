This is a very simple implementation of a helm repo. The setup is done by the magic script found in the scripts folder.

After a chart version changes it should be ran. Once it does it will package your charts into the hosted folder. Then as you push remotely github will rebuild the page. You can then pull your uploaded charts with a direct link, like:


helm pull https://adamma-da.github.io/very-simple-helm-repo/docs/waffle-2.0.4.tgz
helm pull https://adamma-da.github.io/very-simple-helm-repo/docs/waffle-2.0.5.tgz

Dont be alarmed that helm repo search doesnt show your charts. Thats not great but you can still pull using the remote link, which is essentially what we need.