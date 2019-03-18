using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(BNS_web.Startup))]
namespace BNS_web
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
