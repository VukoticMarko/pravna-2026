"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";

const navItems = [
  { label: "PDF Judgements", href: "/judgements_and_laws" },
  { label: "Akoma Ntoso Judgements", href: "/judgements" },
  { label: "Montenegro Law", href: "/laws" },
  { label: "New Judgement", href: "/new_judgement" },
];

export function Navbar() {
  const pathname = usePathname();

  return (
    <nav className="w-full flex items-center justify-between px-6 py-3 bg-gray-950 border-b border-gray-800 shadow-lg z-50">
      {/* Branding */}
      <Link href="/" className="text-white font-bold text-lg tracking-widest uppercase select-none hover:text-purple-300 transition-colors">
        Pravna Informatika
      </Link>

      {/* Nav Links */}
      <div className="flex items-center gap-1">
        {navItems.map((item) => {
          const isActive = pathname === item.href;
          return (
            <Link
              key={item.href}
              href={item.href}
              className={`
                px-4 py-2 rounded-md text-sm font-medium transition-all duration-200
                ${
                  isActive
                    ? "bg-purple-700 text-white shadow-[0_0_12px_2px_rgba(147,51,234,0.5)]"
                    : "text-gray-300 hover:bg-gray-800 hover:text-white"
                }
              `}
            >
              {item.label}
            </Link>
          );
        })}
      </div>
    </nav>
  );
}
