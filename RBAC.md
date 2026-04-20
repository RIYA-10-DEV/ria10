# RBAC (Role Based Access Control)
 The primary security mechanism in kubernetes for regulating access to the kubernetes APT and cluster resources based on the roles assigned to user,groups,and service accounts.

## Simple Summary
1. User Actor (ID,Password) -> Generted Passwprd -> Detail Information (csr) -> Now Create Certificated
2. Enter Cluter -> Role Authorizations -> Select Role (Like Production, Testing , DataBase)
3. Role Attach -> User  (Using Role Binding)

## Authentication 
Authentication verifies the identity of the user or system making the reuest
Handled by API Server (ex; Client Certificates)

## Authorization
Authorization determines what actions you can preform after you are authentication
Access to Specific Task and Rooms

## Main RBAC Object
1. Role : Define Permissions
2. ClusterRole : Global Permissions
3. RoleBinding : Assing Role / ClusterRole
4. ClusterRoleBinding : Assing ClusterRole
