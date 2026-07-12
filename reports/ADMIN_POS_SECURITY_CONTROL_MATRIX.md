# DAHAB PERFUMES - Security Control Matrix

| ID | Control Area | Requirement / Policy | Implementation Status | Verification Target |
|----|--------------|----------------------|-----------------------|---------------------|
| SEC-01 | Password Strengths | Min 15 characters, no arbitrary complexity patterns. Reject breached, weak, or email-derived passwords. | Pending strict schema checks | Server-side validation schema |
| SEC-02 | Password Hashing | Argon2id with unique random salts. | Implemented | Cryptographic check |
| SEC-03 | Session Tokens | Cryptographically random opaque tokens (256-bit entropy). SHA-256 stored in DB. | Implemented | Session audit queries |
| SEC-04 | HttpOnly Cookies | Cookie path, expiration, Secure flag, SameSite=Lax. | Implemented | Browser cookie inspection |
| SEC-05 | Session Lifetime | 30 minutes idle timeout, 12 hours absolute limit for Admin. | Pending middleware timeout checks | Middleware tests |
| SEC-06 | Multi-Factor Auth | TOTP MFA mandatory for Admin & Super Admin. Single-use recovery code hashes. | Pending TOTP setup | MFA flow tests |
| SEC-07 | Brute-force Locking | Max 5 failed logins locks account for 15 mins. Persistent rate limit store. | Pending DB lockout checks | Login integration tests |
| SEC-08 | Privilege Control | RBAC with explicit granular permission gates. | Implemented on POS | Server-side authorization tests |
| SEC-09 | Audit Logging | Append-only database logs for security/operational events. | Implemented | Database check |
| SEC-10 | Data Protection | Customer personal data redacted or restricted. No credentials in logs. | Implemented | Audit log verification |
