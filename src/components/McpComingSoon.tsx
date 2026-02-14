import { cn } from "zudoku";
import { Box } from "./Box";

type DomainInfo = {
  name: string;
  agentType: string;
  capabilities: string[];
};

const domainInfoMap: Record<string, DomainInfo> = {
  "figmatofullstack.ai": {
    name: "FigmaToFullStack",
    agentType: "Figma to Full-Stack Code Generator",
    capabilities: [
      "Convert Figma designs to production-ready code",
      "Support for React, Vue, and Angular frameworks",
      "Responsive design generation",
      "Component library integration",
    ],
  },
  "figmatofullstack.com": {
    name: "FigmaToFullStack",
    agentType: "Figma to Full-Stack Code Generator",
    capabilities: [
      "Convert Figma designs to production-ready code",
      "Support for React, Vue, and Angular frameworks",
      "Responsive design generation",
      "Component library integration",
    ],
  },
  "brightforest.ai": {
    name: "BrightForest",
    agentType: "AI-Powered Development Assistant",
    capabilities: [
      "Code generation and refactoring",
      "Documentation generation",
      "Test case creation",
      "Performance optimization suggestions",
    ],
  },
  "brightforest.io": {
    name: "BrightForest",
    agentType: "AI-Powered Development Assistant",
    capabilities: [
      "Code generation and refactoring",
      "Documentation generation",
      "Test case creation",
      "Performance optimization suggestions",
    ],
  },
  "brightforestx.com": {
    name: "BrightForestX",
    agentType: "Advanced Development Platform",
    capabilities: [
      "Multi-language code generation",
      "Architecture design assistance",
      "Code review and analysis",
      "Integration with popular IDEs",
    ],
  },
  "brightpath.ai": {
    name: "BrightPath",
    agentType: "Learning Path Generator",
    capabilities: [
      "Personalized learning recommendations",
      "Skill assessment and tracking",
      "Interactive tutorials",
      "Progress analytics",
    ],
  },
  "pathx.ai": {
    name: "PathX",
    agentType: "Career Navigation Assistant",
    capabilities: [
      "Career path recommendations",
      "Skill gap analysis",
      "Job market insights",
      "Interview preparation",
    ],
  },
  "iheartai.ai": {
    name: "iHeartAI",
    agentType: "AI Companion and Assistant",
    capabilities: [
      "Natural language understanding",
      "Task automation",
      "Knowledge management",
      "Personalized recommendations",
    ],
  },
  "appnowhq.com": {
    name: "AppNow",
    agentType: "Rapid Application Development",
    capabilities: [
      "No-code/Low-code development",
      "Template library",
      "Deployment automation",
      "API integration",
    ],
  },
  "getdiyai.com": {
    name: "DIY AI",
    agentType: "DIY AI Builder",
    capabilities: [
      "Custom AI model training",
      "Pre-built AI components",
      "Data pipeline management",
      "Model deployment",
    ],
  },
  "getdiyrpa.com": {
    name: "DIY RPA",
    agentType: "Robotic Process Automation",
    capabilities: [
      "Workflow automation",
      "Task recording and replay",
      "Integration with business apps",
      "Scheduling and monitoring",
    ],
  },
  "mlninjas.com": {
    name: "ML Ninjas",
    agentType: "Machine Learning Expert",
    capabilities: [
      "ML model development",
      "Data preprocessing",
      "Model evaluation and tuning",
      "Production deployment",
    ],
  },
  "clifforddalsoniii.com": {
    name: "Clifford Dalson III",
    agentType: "Personal AI Assistant",
    capabilities: [
      "Content creation",
      "Research assistance",
      "Project management",
      "Communication tools",
    ],
  },
};

const getDomainInfo = (domain?: string): DomainInfo => {
  if (!domain) {
    return {
      name: "MCP Server",
      agentType: "Model Context Protocol Server",
      capabilities: [
        "Context-aware responses",
        "Tool integration",
        "Resource management",
        "Sampling capabilities",
      ],
    };
  }

  return (
    domainInfoMap[domain] || {
      name: domain,
      agentType: "AI Assistant",
      capabilities: [
        "Context-aware responses",
        "Tool integration",
        "Resource management",
        "Custom capabilities",
      ],
    }
  );
};

export const McpComingSoon = () => {
  const domain = import.meta.env.ZUDOKU_PUBLIC_DOMAIN as string | undefined;
  const domainInfo = getDomainInfo(domain);
  const connectionUrl = `mcp://${domain || "your-domain"}/v1`;

  return (
    <div className="container mx-auto p-6 max-w-4xl">
      <Box className="relative overflow-hidden bg-gradient-to-br from-white to-gray-50 dark:from-gray-900 dark:to-gray-800 p-8 shadow-lg">
        {/* Background decoration */}
        <div className="absolute top-0 right-0 w-64 h-64 bg-primary/5 rounded-full blur-3xl -translate-y-1/2 translate-x-1/2" />
        <div className="absolute bottom-0 left-0 w-64 h-64 bg-primary/5 rounded-full blur-3xl translate-y-1/2 -translate-x-1/2" />

        <div className="relative z-10">
          {/* Header with pulsing badge */}
          <div className="flex items-start justify-between mb-6">
            <div>
              <h1 className="text-3xl font-bold text-gray-900 dark:text-white mb-2">
                {domainInfo.name}
              </h1>
              <p className="text-lg text-gray-600 dark:text-gray-300">
                {domainInfo.agentType}
              </p>
            </div>
            <div className="relative">
              <span className="inline-flex items-center px-4 py-2 rounded-full text-sm font-semibold bg-primary text-primaryForeground">
                Coming Soon
              </span>
              <span className="absolute inset-0 rounded-full bg-primary animate-ping opacity-30" />
            </div>
          </div>

          {/* MCP Protocol Badge */}
          <div className="mb-8">
            <div className="inline-flex items-center gap-2 px-4 py-2 rounded-lg bg-gray-100 dark:bg-gray-800 border border-gray-200 dark:border-gray-700">
              <svg
                className="w-5 h-5 text-primary"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  strokeWidth={2}
                  d="M13 10V3L4 14h7v7l9-11h-7z"
                />
              </svg>
              <span className="text-sm font-medium text-gray-700 dark:text-gray-300">
                Model Context Protocol (MCP)
              </span>
            </div>
          </div>

          {/* Connection URL */}
          <div className="mb-8">
            <div className="block text-sm font-semibold text-gray-700 dark:text-gray-300 mb-2">
              Connection URL
            </div>
            <div className="flex items-center gap-2">
              <code
                className={cn(
                  "flex-1 px-4 py-3 rounded-lg font-mono text-sm",
                  "bg-gray-100 dark:bg-gray-800",
                  "border border-gray-200 dark:border-gray-700",
                  "text-gray-800 dark:text-gray-200",
                )}
              >
                {connectionUrl}
              </code>
              <button
                type="button"
                className={cn(
                  "px-4 py-3 rounded-lg font-medium text-sm",
                  "bg-gray-200 dark:bg-gray-700",
                  "hover:bg-gray-300 dark:hover:bg-gray-600",
                  "text-gray-700 dark:text-gray-300",
                  "transition-colors duration-200",
                  "border border-gray-300 dark:border-gray-600",
                )}
                onClick={() => {
                  navigator.clipboard.writeText(connectionUrl);
                }}
                title="Copy to clipboard"
              >
                Copy
              </button>
            </div>
          </div>

          {/* Expected Capabilities */}
          <div>
            <h2 className="text-xl font-semibold text-gray-900 dark:text-white mb-4">
              Expected Capabilities
            </h2>
            <div className="grid gap-3">
              {domainInfo.capabilities.map((capability) => (
                <div
                  key={capability}
                  className={cn(
                    "flex items-start gap-3 p-4 rounded-lg",
                    "bg-gray-50 dark:bg-gray-800/50",
                    "border border-gray-200 dark:border-gray-700",
                    "transition-all duration-200",
                    "hover:border-primary/50 hover:bg-gray-100 dark:hover:bg-gray-800",
                  )}
                >
                  <svg
                    className="w-5 h-5 text-primary flex-shrink-0 mt-0.5"
                    fill="none"
                    stroke="currentColor"
                    viewBox="0 0 24 24"
                    xmlns="http://www.w3.org/2000/svg"
                  >
                    <path
                      strokeLinecap="round"
                      strokeLinejoin="round"
                      strokeWidth={2}
                      d="M5 13l4 4L19 7"
                    />
                  </svg>
                  <span className="text-gray-700 dark:text-gray-300">
                    {capability}
                  </span>
                </div>
              ))}
            </div>
          </div>

          {/* Info note */}
          <div className="mt-8 p-4 rounded-lg bg-blue-50 dark:bg-blue-900/20 border border-blue-200 dark:border-blue-800">
            <p className="text-sm text-blue-800 dark:text-blue-200">
              <strong>Note:</strong> This MCP endpoint is under development. The
              capabilities listed above are planned features and may be subject
              to change. Check back soon for updates!
            </p>
          </div>
        </div>
      </Box>
    </div>
  );
};
