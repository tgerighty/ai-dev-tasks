# Form Handling Pattern

## Implementation Order
1. **Schema Definition** - Validation rules
2. **Form Component** - UI structure
3. **Validation Logic** - Client-side checks
4. **Submit Handler** - API integration
5. **Error/Success Feedback** - User experience

## Schema Definition (Zod)
```typescript
// src/lib/schemas/contact.ts
export const contactSchema = z.object({
  name: z.string().min(2, "Name must be at least 2 characters"),
  email: z.string().email("Invalid email address"),
  phone: z.string().regex(/^\+?[\d\s-()]+$/, "Invalid phone number").optional(),
  message: z.string().min(10, "Message must be at least 10 characters"),
  consent: z.boolean().refine((val) => val === true, {
    message: "You must agree to the terms",
  }),
});

export type ContactForm = z.infer<typeof contactSchema>;
```

## Form Component (React Hook Form + Zod)
```typescript
// src/components/forms/contact-form.tsx
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";

export function ContactForm() {
  const {
    register,
    handleSubmit,
    formState: { errors, isSubmitting },
    reset,
  } = useForm<ContactForm>({
    resolver: zodResolver(contactSchema),
    defaultValues: {
      name: "",
      email: "",
      phone: "",
      message: "",
      consent: false,
    },
  });

  const mutation = api.contact.submit.useMutation({
    onSuccess: () => {
      toast.success("Message sent successfully!");
      reset();
    },
    onError: (error) => {
      toast.error(error.message || "Failed to send message");
    },
  });

  const onSubmit = async (data: ContactForm) => {
    await mutation.mutateAsync(data);
  };

  return (
    <form onSubmit={handleSubmit(onSubmit)} className="space-y-4">
      <div>
        <Label htmlFor="name">Name *</Label>
        <Input
          id="name"
          {...register("name")}
          aria-invalid={!!errors.name}
        />
        {errors.name && (
          <p className="text-sm text-destructive">{errors.name.message}</p>
        )}
      </div>

      <div>
        <Label htmlFor="email">Email *</Label>
        <Input
          id="email"
          type="email"
          {...register("email")}
          aria-invalid={!!errors.email}
        />
        {errors.email && (
          <p className="text-sm text-destructive">{errors.email.message}</p>
        )}
      </div>

      <div>
        <Label htmlFor="phone">Phone</Label>
        <Input
          id="phone"
          type="tel"
          {...register("phone")}
          aria-invalid={!!errors.phone}
        />
        {errors.phone && (
          <p className="text-sm text-destructive">{errors.phone.message}</p>
        )}
      </div>

      <div>
        <Label htmlFor="message">Message *</Label>
        <Textarea
          id="message"
          {...register("message")}
          rows={4}
          aria-invalid={!!errors.message}
        />
        {errors.message && (
          <p className="text-sm text-destructive">{errors.message.message}</p>
        )}
      </div>

      <div className="flex items-center space-x-2">
        <Checkbox
          id="consent"
          {...register("consent")}
          aria-invalid={!!errors.consent}
        />
        <Label htmlFor="consent" className="text-sm">
          I agree to the terms and conditions *
        </Label>
      </div>
      {errors.consent && (
        <p className="text-sm text-destructive">{errors.consent.message}</p>
      )}

      <Button type="submit" disabled={isSubmitting}>
        {isSubmitting ? (
          <>
            <Loader2 className="mr-2 h-4 w-4 animate-spin" />
            Sending...
          </>
        ) : (
          "Send Message"
        )}
      </Button>
    </form>
  );
}
```

## API Endpoint
```typescript
// src/server/api/routers/contact.ts
export const contactRouter = createTRPCRouter({
  submit: publicProcedure
    .input(contactSchema)
    .mutation(async ({ ctx, input }) => {
      // Save to database
      const contact = await ctx.db.insert(contacts).values({
        ...input,
        submittedAt: new Date(),
        ipAddress: ctx.req.ip,
      }).returning();

      // Send email notification (optional)
      if (env.ENABLE_EMAIL_NOTIFICATIONS) {
        await sendEmail({
          to: env.ADMIN_EMAIL,
          subject: `New contact from ${input.name}`,
          html: formatContactEmail(input),
        });
      }

      return { success: true, id: contact[0].id };
    }),
});
```

## Tests
```typescript
// tests/unit/contact-form.test.tsx
describe("ContactForm", () => {
  it("should validate required fields", async () => {
    const { getByRole, findByText } = render(<ContactForm />);

    fireEvent.click(getByRole("button", { name: /send/i }));

    expect(await findByText(/name must be at least/i)).toBeInTheDocument();
    expect(await findByText(/invalid email/i)).toBeInTheDocument();
    expect(await findByText(/message must be at least/i)).toBeInTheDocument();
  });

  it("should submit valid form", async () => {
    const { getByLabelText, getByRole } = render(<ContactForm />);

    fireEvent.change(getByLabelText(/name/i), { target: { value: "John Doe" } });
    fireEvent.change(getByLabelText(/email/i), { target: { value: "john@example.com" } });
    fireEvent.change(getByLabelText(/message/i), { target: { value: "This is a test message" } });
    fireEvent.click(getByLabelText(/i agree/i));

    fireEvent.click(getByRole("button", { name: /send/i }));

    await waitFor(() => {
      expect(mockSubmit).toHaveBeenCalledWith({
        name: "John Doe",
        email: "john@example.com",
        message: "This is a test message",
        consent: true,
      });
    });
  });
});
```

## Micro-Task Breakdown
1. **MT 1.1**: Create Zod schema (10 min)
2. **MT 1.2**: Create form component structure (20 min)
3. **MT 1.3**: Add form validation (15 min)
4. **MT 1.4**: Create API endpoint (15 min)
5. **MT 1.5**: Add submit handler (10 min)
6. **MT 1.6**: Add error/success feedback (10 min)
7. **MT 1.7**: Write unit tests (20 min)