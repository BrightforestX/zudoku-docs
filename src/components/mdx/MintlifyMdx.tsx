import { Children, isValidElement, type ReactNode, useState } from "react";
import { cn } from "zudoku";
import { Link } from "zudoku/components";
import {
  BookOpenIcon,
  type LucideIcon,
  PlayCircleIcon,
  UsersIcon,
} from "zudoku/icons";
import { Callout } from "zudoku/ui/Callout.js";

const iconMap: Record<string, LucideIcon> = {
  play: PlayCircleIcon,
  users: UsersIcon,
  book: BookOpenIcon,
};

export function CardGroup({
  cols = 2,
  children,
}: {
  cols?: number;
  children?: ReactNode;
}) {
  return (
    <div
      className={cn(
        "grid gap-4 not-prose",
        cols === 2 && "md:grid-cols-2",
        cols === 3 && "md:grid-cols-3",
      )}
    >
      {children}
    </div>
  );
}

export function Card({
  title,
  icon,
  href,
  children,
}: {
  title: string;
  icon?: string;
  href?: string;
  children?: ReactNode;
}) {
  const Icon = icon && iconMap[icon] ? iconMap[icon] : null;
  const inner = (
    <>
      <div className="mb-2 flex items-start gap-3">
        {Icon ? (
          <Icon className="mt-0.5 h-6 w-6 shrink-0 text-primary" aria-hidden />
        ) : null}
        <h3 className="m-0 text-lg font-semibold">{title}</h3>
      </div>
      <div className="text-sm text-muted-foreground">{children}</div>
    </>
  );
  const className = cn(
    "block h-full rounded-lg border border-border bg-card p-5 text-inherit no-underline transition-shadow hover:shadow-md",
  );
  if (href?.startsWith("http")) {
    return (
      <a href={href} className={className} rel="noreferrer">
        {inner}
      </a>
    );
  }
  if (href) {
    return (
      <Link to={href} className={className} relative="path">
        {inner}
      </Link>
    );
  }
  return <div className={className}>{inner}</div>;
}

const badgeVariantClass: Record<string, string> = {
  warning:
    "border-amber-200 bg-amber-100 text-amber-900 dark:border-amber-800 dark:bg-amber-950 dark:text-amber-100",
  info: "border-sky-200 bg-sky-100 text-sky-900 dark:border-sky-800 dark:bg-sky-950 dark:text-sky-100",
  default: "border-border bg-muted text-muted-foreground",
};

export function Badge({
  variant = "default",
  children,
}: {
  variant?: "warning" | "info" | "default";
  children?: ReactNode;
}) {
  return (
    <span
      className={cn(
        "not-prose inline-flex items-center rounded-md border px-2 py-0.5 align-middle text-xs font-medium",
        badgeVariantClass[variant] ?? badgeVariantClass.default,
      )}
    >
      {children}
    </span>
  );
}

type TabPanel = { title: string; content: ReactNode };

function parseTabPanels(children: ReactNode): TabPanel[] {
  return Children.toArray(children)
    .filter(isValidElement)
    .map((el) => {
      const p = el.props as { title?: string; children?: ReactNode };
      return {
        title: typeof p.title === "string" ? p.title : "Tab",
        content: p.children,
      };
    });
}

export function Tabs({ children }: { children?: ReactNode }) {
  const panels = parseTabPanels(children);
  const [active, setActive] = useState(0);
  if (panels.length === 0) {
    return null;
  }
  return (
    <div className="not-prose my-6 overflow-hidden rounded-lg border border-border bg-card">
      <div className="flex flex-wrap gap-1 border-b border-border bg-muted/40 p-2">
        {panels.map((p, i) => (
          <button
            key={p.title}
            type="button"
            onClick={() => setActive(i)}
            className={cn(
              "rounded-md px-3 py-1.5 text-sm font-medium transition-colors",
              i === active
                ? "bg-background text-foreground shadow-sm"
                : "text-muted-foreground hover:text-foreground",
            )}
          >
            {p.title}
          </button>
        ))}
      </div>
      <div className="prose max-w-none p-4 dark:prose-invert">
        {panels[active]?.content}
      </div>
    </div>
  );
}

/** Placeholder for MDX; content is read by `Tabs` from element props. */
export function Tab({
  children: _children,
}: {
  title: string;
  children?: ReactNode;
}) {
  void _children;
  return null;
}

export function Info({
  children,
  ...rest
}: {
  children?: ReactNode;
  title?: string;
  className?: string;
}) {
  return (
    <Callout type="info" {...rest}>
      {children ?? null}
    </Callout>
  );
}

export function Warning({
  children,
  ...rest
}: {
  children?: ReactNode;
  title?: string;
  className?: string;
}) {
  return (
    <Callout type="caution" {...rest}>
      {children ?? null}
    </Callout>
  );
}
