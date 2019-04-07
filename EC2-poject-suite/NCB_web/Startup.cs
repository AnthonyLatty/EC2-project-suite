using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(NCB_web.Startup))]
namespace NCB_web
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
