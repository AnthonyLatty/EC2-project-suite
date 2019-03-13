using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(JPS_web.Startup))]
namespace JPS_web
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
