import { lazy } from "react";

const ProductCard = ({
  title,
  description,
  icon,
  link,
  features,
}: {
  title: string;
  description: string;
  icon: string;
  link: string;
  features: string[];
}) => (
  <div className="group relative overflow-hidden rounded-2xl border border-border bg-card p-6 transition-all hover:shadow-lg hover:border-primary">
    <div className="mb-4 flex items-center gap-3">
      <div className="flex h-12 w-12 items-center justify-center rounded-lg bg-primary/10 text-primary text-2xl">
        {icon}
      </div>
      <h3 className="text-xl font-bold">{title}</h3>
    </div>
    
    <p className="mb-4 text-muted-foreground">{description}</p>
    
    <ul className="mb-6 space-y-2">
      {features.map((feature, index) => (
        <li key={index} className="flex items-start gap-2 text-sm">
          <span className="text-primary mt-0.5">✓</span>
          <span>{feature}</span>
        </li>
      ))}
    </ul>
    
    <a
      href={link}
      className="inline-flex items-center gap-2 text-primary font-medium hover:gap-3 transition-all"
    >
      Learn More
      <svg
        className="w-4 h-4"
        fill="none"
        stroke="currentColor"
        viewBox="0 0 24 24"
      >
        <path
          strokeLinecap="round"
          strokeLinejoin="round"
          strokeWidth={2}
          d="M9 5l7 7-7 7"
        />
      </svg>
    </a>
  </div>
);

const ProductsShowcase = () => {
  const products = [
    {
      title: "MCP Server",
      description: "Connect AI assistants directly to documentation with our FastMCP-based server.",
      icon: "🤖",
      link: "/docs/products/mcp-server",
      features: [
        "FastMCP architecture for high performance",
        "Real-time updates with WebSocket support",
        "OAuth2 authentication",
        "Full-text search capabilities",
        "Analytics and tracking",
      ],
    },
    {
      title: "Mobile App",
      description: "Access documentation on iOS and Android with offline support and voice navigation.",
      icon: "📱",
      link: "/docs/products/mobile-app",
      features: [
        "Native Flutter performance",
        "Complete offline caching",
        "Voice navigation and TTS",
        "Interactive code examples",
        "Beautiful Material Design 3 UI",
      ],
    },
    {
      title: "CLI Tool",
      description: "Powerful Go-based command-line interface for terminal documentation access.",
      icon: "⚡",
      link: "/docs/products/cli-tool",
      features: [
        "Lightning-fast Go implementation",
        "Full-text search from terminal",
        "Offline sync capabilities",
        "Multiple output formats (JSON/YAML/Table)",
        "CI/CD integration ready",
      ],
    },
  ];

  return (
    <div className="py-16">
      <div className="mb-12 text-center">
        <h2 className="text-4xl font-bold mb-4">
          Access Documentation Your Way
        </h2>
        <p className="text-xl text-muted-foreground max-w-2xl mx-auto">
          Choose the platform that fits your workflow - web, mobile, or terminal.
          All with 100% test coverage and production-ready quality.
        </p>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        {products.map((product) => (
          <ProductCard key={product.title} {...product} />
        ))}
      </div>

      <div className="mt-12 p-6 rounded-2xl bg-primary/5 border border-primary/20">
        <div className="flex items-start gap-4">
          <div className="text-3xl">🎯</div>
          <div>
            <h3 className="text-xl font-bold mb-2">Unified Developer Experience</h3>
            <p className="text-muted-foreground mb-4">
              All our products integrate seamlessly with unified authentication,
              synchronized bookmarks, and consistent APIs across platforms.
            </p>
            <div className="grid grid-cols-1 md:grid-cols-3 gap-4 text-sm">
              <div>
                <div className="font-semibold mb-1">🔐 Unified Auth</div>
                <div className="text-muted-foreground">
                  Single sign-on across all platforms
                </div>
              </div>
              <div>
                <div className="font-semibold mb-1">🔄 Data Sync</div>
                <div className="text-muted-foreground">
                  Bookmarks and history synced in real-time
                </div>
              </div>
              <div>
                <div className="font-semibold mb-1">✅ 100% Tested</div>
                <div className="text-muted-foreground">
                  Unit, E2E, and mutation testing
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default ProductsShowcase;
