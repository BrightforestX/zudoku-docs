import { useState } from "react";
import { cn } from "zudoku";

export type CliCommandProps = {
  command: string;
  description?: string;
  className?: string;
};

export const CliCommand = ({
  command,
  description,
  className,
}: CliCommandProps) => {
  const [copied, setCopied] = useState(false);

  const handleCopy = async () => {
    try {
      await navigator.clipboard.writeText(command);
      setCopied(true);
      setTimeout(() => setCopied(false), 2000);
    } catch (_err) {
      // Failed to copy - silently fail
    }
  };

  return (
    <div className={cn("space-y-2", className)}>
      {description && (
        <p className="text-sm text-muted-foreground">{description}</p>
      )}
      <div className="relative group">
        <div className="flex items-center gap-2 rounded-lg bg-slate-900 dark:bg-slate-800 p-4 font-mono text-sm">
          <span className="text-slate-400 select-none">$</span>
          <code className="flex-1 text-slate-100">{command}</code>
          <button
            type="button"
            onClick={handleCopy}
            className="opacity-0 group-hover:opacity-100 transition-opacity rounded px-2 py-1 text-xs bg-slate-700 hover:bg-slate-600 text-slate-100"
            aria-label="Copy command"
          >
            {copied ? "Copied!" : "Copy"}
          </button>
        </div>
      </div>
    </div>
  );
};
