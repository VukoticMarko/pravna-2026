import { Button } from "@/components/ui/button";
import { LucideIcon } from "lucide-react";

interface ListItemProps {
  text: string;
  isSelected: boolean;
  Icon: LucideIcon;
  onClick: () => void;
}

export function ListItem({ text, isSelected, Icon, onClick }: ListItemProps) {
  return (
    <Button
      variant={isSelected ? "default" : "outline"}
      size="lg"
      className="w-full justify-start py-8 mb-1"
      onClick={onClick}
    >
      <Icon className="mr-2" />
      {text}
    </Button>
  );
}
