import type { ReactNode } from "react";

type DomainHeroProps = {
  domain: string;
  title?: string;
  description?: ReactNode;
  className?: string;
};

export const DomainHero = ({
  domain,
  title,
  description,
  className = "",
}: DomainHeroProps) => {
  // Try to load hero.png first, fallback to placeholder.svg
  const heroImagePath = `/images/${domain}/hero.png`;
  const placeholderImagePath = `/images/${domain}/placeholder.svg`;

  return (
    <div
      className={`relative w-full overflow-hidden rounded-lg border border-border shadow-md ${className}`}
    >
      <div className="relative h-64 w-full">
        <picture>
          <source srcSet={heroImagePath} type="image/png" />
          <img
            src={placeholderImagePath}
            alt={title ? `${title} hero image` : `${domain} hero image`}
            className="h-full w-full object-cover"
            loading="lazy"
            onError={(e) => {
              // If hero.png fails, ensure we're using placeholder.svg
              const target = e.target as HTMLImageElement;
              if (target.src !== placeholderImagePath) {
                target.src = placeholderImagePath;
              }
            }}
          />
        </picture>
        {(title || description) && (
          <div className="absolute inset-0 flex flex-col items-center justify-center bg-gradient-to-b from-black/30 to-black/50 p-8 text-center">
            {title && (
              <h1 className="mb-2 text-4xl font-bold text-white drop-shadow-lg">
                {title}
              </h1>
            )}
            {description && (
              <p className="text-lg text-white/90 drop-shadow-md">
                {description}
              </p>
            )}
          </div>
        )}
      </div>
    </div>
  );
};
