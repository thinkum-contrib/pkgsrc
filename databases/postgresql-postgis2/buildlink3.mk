# $NetBSD: buildlink3.mk,v 1.19 2021/12/28 21:10:53 triaxx Exp $

BUILDLINK_TREE+=	postgresql-postgis

.if !defined(POSTGRESQL_POSTGIS_BUILDLINK3_MK)
POSTGRESQL_POSTGIS_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.postgresql-postgis+=	postgresql${PGSQL_VERSION}-postgis>=2.0
BUILDLINK_ABI_DEPENDS.postgresql-postgis?=	postgresql${PGSQL_VERSION}-postgis>=3.1.4nb5
BUILDLINK_PKGSRCDIR.postgresql-postgis?=	../../databases/postgresql-postgis2

.include "../../geography/geos/buildlink3.mk"
.include "../../geography/proj/buildlink3.mk"
.include "../../mk/pgsql.buildlink3.mk"
.endif	# POSTGRESQL_POSTGIS_BUILDLINK3_MK

BUILDLINK_TREE+=	-postgresql-postgis
