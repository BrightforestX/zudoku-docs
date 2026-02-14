import { cn } from "zudoku";

type CliCommandProps = {
  command: string;
  description?: string;
  className?: string;
};

export const CliCommand = ({
  command,
  description,
  className,
}: CliCommandProps) => {
  const handleCopy = () => {
    navigator.clipboard.writeText(command);
  };

  return (
    <div className={cn("space-y-2", className)}>
      {description && (
        <p className="text-sm text-gray-600 dark:text-gray-400">
          {description}
        </p>
      )}
      <div className="flex items-center gap-2">
        <code
          className={cn(
            "flex-1 px-4 py-3 rounded-lg font-mono text-sm",
            "bg-gray-100 dark:bg-gray-800",
            "border border-gray-200 dark:border-gray-700",
            "text-gray-800 dark:text-gray-200",
          )}
        >
          {command}
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
          onClick={handleCopy}
          title="Copy to clipboard"
        >
          Copy
        </button>
      </div>
    </div>
  );
};
