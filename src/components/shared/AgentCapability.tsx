import type { ReactNode } from "react";
import { cn } from "zudoku";

type AgentCapabilityProps = {
  name: string;
  agentType: string;
  capabilities: string[];
  domain?: string;
  icon?: ReactNode;
  className?: string;
};

export const AgentCapability = ({
  name,
  agentType,
  capabilities,
  domain,
  icon,
  className,
}: AgentCapabilityProps) => {
  return (
    <div
      className={cn(
        "p-6 rounded-lg",
        "bg-white dark:bg-gray-800",
        "border border-gray-200 dark:border-gray-700",
        "transition-all duration-200",
        "hover:border-primary/50 hover:shadow-lg",
        className,
      )}
    >
      <div className="flex items-start gap-4 mb-4">
        {icon && (
          <div className="w-12 h-12 flex-shrink-0 flex items-center justify-center rounded-lg bg-primary/10 text-primary">
            {icon}
          </div>
        )}
        <div className="flex-1 min-w-0">
          <h3 className="text-xl font-semibold text-gray-900 dark:text-white mb-1">
            {name}
          </h3>
          <p className="text-sm text-gray-600 dark:text-gray-400 mb-2">
            {agentType}
          </p>
          {domain && (
            <code className="text-xs text-gray-500 dark:text-gray-500 break-all">
              {domain}
            </code>
          )}
        </div>
      </div>

      <div className="space-y-2">
        <h4 className="text-sm font-semibold text-gray-700 dark:text-gray-300 mb-3">
          Capabilities
        </h4>
        <div className="grid gap-2">
          {capabilities.map((capability) => (
            <div
              key={capability}
              className="flex items-start gap-2 text-sm text-gray-600 dark:text-gray-300"
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
              <span>{capability}</span>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
};
