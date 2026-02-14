import { cn } from "zudoku";

export type ConnectionStatus = "connected" | "disconnected" | "pending";

export type AgentCapabilityProps = {
  agentName: string;
  domain: string;
  capabilities: string[];
  connectionStatus: ConnectionStatus;
  className?: string;
};

const statusConfig: Record<
  ConnectionStatus,
  { label: string; className: string; dotClassName: string }
> = {
  connected: {
    label: "Connected",
    className: "text-green-600 dark:text-green-400",
    dotClassName: "bg-green-600 dark:bg-green-400",
  },
  disconnected: {
    label: "Disconnected",
    className: "text-red-600 dark:text-red-400",
    dotClassName: "bg-red-600 dark:bg-red-400",
  },
  pending: {
    label: "Pending",
    className: "text-yellow-600 dark:text-yellow-400",
    dotClassName: "bg-yellow-600 dark:bg-yellow-400",
  },
};

export const AgentCapability = ({
  agentName,
  domain,
  capabilities,
  connectionStatus,
  className,
}: AgentCapabilityProps) => {
  const status = statusConfig[connectionStatus];

  return (
    <div
      className={cn(
        "rounded-lg border border-border bg-card p-6 space-y-4",
        className,
      )}
    >
      {/* Header */}
      <div className="flex items-start justify-between">
        <div className="flex-1">
          <h3 className="text-xl font-semibold mb-1">{agentName}</h3>
          <p className="text-sm text-muted-foreground">{domain}</p>
        </div>
        <div
          className={cn("flex items-center gap-2 text-sm", status.className)}
        >
          <span
            className={cn(
              "h-2 w-2 rounded-full animate-pulse",
              status.dotClassName,
            )}
          />
          {status.label}
        </div>
      </div>

      {/* Capabilities */}
      <div className="space-y-2">
        <h4 className="text-sm font-medium text-muted-foreground">
          Capabilities
        </h4>
        <ul className="space-y-1">
          {capabilities.map((capability) => (
            <li key={capability} className="flex items-start gap-2 text-sm">
              <span className="text-primary mt-1">•</span>
              <span>{capability}</span>
            </li>
          ))}
        </ul>
      </div>
    </div>
  );
};
