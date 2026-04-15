import { Button } from "@/components/ui/button";
import { LucideIcon } from "lucide-react";
import Link from "next/link";

interface LinkButtonProps {
  text: string;
  link: string;
  Icon: LucideIcon;
  pathname: string;
}

export function LinkButton({ text, Icon, link, pathname }: LinkButtonProps) {
  return (
    <Button
      asChild
      variant={pathname === link ? "default" : "ghost"}
      className="w-full justify-start"
    >
      <Link href={link}>
        <Icon className="mr-2" />
        {text}
      </Link>
    </Button>
  );
}
