-- Compute Metrics via Expressions
SELECT
  subq_7.identity_verifications
  , subq_7.user__home_state
FROM (
  -- Aggregate Measures
  SELECT
    SUM(subq_6.identity_verifications) AS identity_verifications
    , subq_6.user__home_state
  FROM (
    -- Pass Only Elements:
    --   ['identity_verifications', 'user__home_state']
    SELECT
      subq_5.identity_verifications
      , subq_5.user__home_state
    FROM (
      -- Join Standard Outputs
      SELECT
        subq_2.identity_verifications AS identity_verifications
        , subq_4.home_state AS user__home_state
        , subq_2.ds_partitioned AS ds_partitioned
        , subq_4.ds_partitioned AS user__ds_partitioned
        , subq_2.user AS user
      FROM (
        -- Pass Only Elements:
        --   ['identity_verifications', 'user', 'ds_partitioned']
        SELECT
          subq_1.identity_verifications
          , subq_1.ds_partitioned
          , subq_1.user
        FROM (
          -- Metric Time Dimension 'ds'
          SELECT
            subq_0.identity_verifications
            , subq_0.verification_type
            , subq_0.verification__verification_type
            , subq_0.ds
            , subq_0.ds__week
            , subq_0.ds__month
            , subq_0.ds__quarter
            , subq_0.ds__year
            , subq_0.ds_partitioned
            , subq_0.ds_partitioned__week
            , subq_0.ds_partitioned__month
            , subq_0.ds_partitioned__quarter
            , subq_0.ds_partitioned__year
            , subq_0.verification__ds
            , subq_0.verification__ds__week
            , subq_0.verification__ds__month
            , subq_0.verification__ds__quarter
            , subq_0.verification__ds__year
            , subq_0.verification__ds_partitioned
            , subq_0.verification__ds_partitioned__week
            , subq_0.verification__ds_partitioned__month
            , subq_0.verification__ds_partitioned__quarter
            , subq_0.verification__ds_partitioned__year
            , subq_0.ds AS metric_time
            , subq_0.ds__week AS metric_time__week
            , subq_0.ds__month AS metric_time__month
            , subq_0.ds__quarter AS metric_time__quarter
            , subq_0.ds__year AS metric_time__year
            , subq_0.verification
            , subq_0.user
            , subq_0.verification__user
          FROM (
            -- Read Elements From Data Source 'id_verifications'
            SELECT
              1 AS identity_verifications
              , id_verifications_src_10002.ds
              , DATE_TRUNC('week', id_verifications_src_10002.ds) AS ds__week
              , DATE_TRUNC('month', id_verifications_src_10002.ds) AS ds__month
              , DATE_TRUNC('quarter', id_verifications_src_10002.ds) AS ds__quarter
              , DATE_TRUNC('year', id_verifications_src_10002.ds) AS ds__year
              , id_verifications_src_10002.ds_partitioned
              , DATE_TRUNC('week', id_verifications_src_10002.ds_partitioned) AS ds_partitioned__week
              , DATE_TRUNC('month', id_verifications_src_10002.ds_partitioned) AS ds_partitioned__month
              , DATE_TRUNC('quarter', id_verifications_src_10002.ds_partitioned) AS ds_partitioned__quarter
              , DATE_TRUNC('year', id_verifications_src_10002.ds_partitioned) AS ds_partitioned__year
              , id_verifications_src_10002.verification_type
              , id_verifications_src_10002.ds AS verification__ds
              , DATE_TRUNC('week', id_verifications_src_10002.ds) AS verification__ds__week
              , DATE_TRUNC('month', id_verifications_src_10002.ds) AS verification__ds__month
              , DATE_TRUNC('quarter', id_verifications_src_10002.ds) AS verification__ds__quarter
              , DATE_TRUNC('year', id_verifications_src_10002.ds) AS verification__ds__year
              , id_verifications_src_10002.ds_partitioned AS verification__ds_partitioned
              , DATE_TRUNC('week', id_verifications_src_10002.ds_partitioned) AS verification__ds_partitioned__week
              , DATE_TRUNC('month', id_verifications_src_10002.ds_partitioned) AS verification__ds_partitioned__month
              , DATE_TRUNC('quarter', id_verifications_src_10002.ds_partitioned) AS verification__ds_partitioned__quarter
              , DATE_TRUNC('year', id_verifications_src_10002.ds_partitioned) AS verification__ds_partitioned__year
              , id_verifications_src_10002.verification_type AS verification__verification_type
              , id_verifications_src_10002.verification_id AS verification
              , id_verifications_src_10002.user_id AS user
              , id_verifications_src_10002.user_id AS verification__user
            FROM ***************************.fct_id_verifications id_verifications_src_10002
          ) subq_0
        ) subq_1
      ) subq_2
      LEFT OUTER JOIN (
        -- Pass Only Elements:
        --   ['user', 'ds_partitioned', 'home_state']
        SELECT
          subq_3.home_state
          , subq_3.ds_partitioned
          , subq_3.user
        FROM (
          -- Read Elements From Data Source 'users_ds_source'
          SELECT
            users_ds_source_src_10006.ds
            , DATE_TRUNC('week', users_ds_source_src_10006.ds) AS ds__week
            , DATE_TRUNC('month', users_ds_source_src_10006.ds) AS ds__month
            , DATE_TRUNC('quarter', users_ds_source_src_10006.ds) AS ds__quarter
            , DATE_TRUNC('year', users_ds_source_src_10006.ds) AS ds__year
            , users_ds_source_src_10006.created_at
            , DATE_TRUNC('week', users_ds_source_src_10006.created_at) AS created_at__week
            , DATE_TRUNC('month', users_ds_source_src_10006.created_at) AS created_at__month
            , DATE_TRUNC('quarter', users_ds_source_src_10006.created_at) AS created_at__quarter
            , DATE_TRUNC('year', users_ds_source_src_10006.created_at) AS created_at__year
            , users_ds_source_src_10006.ds_partitioned
            , DATE_TRUNC('week', users_ds_source_src_10006.ds_partitioned) AS ds_partitioned__week
            , DATE_TRUNC('month', users_ds_source_src_10006.ds_partitioned) AS ds_partitioned__month
            , DATE_TRUNC('quarter', users_ds_source_src_10006.ds_partitioned) AS ds_partitioned__quarter
            , DATE_TRUNC('year', users_ds_source_src_10006.ds_partitioned) AS ds_partitioned__year
            , users_ds_source_src_10006.home_state
            , users_ds_source_src_10006.ds AS user__ds
            , DATE_TRUNC('week', users_ds_source_src_10006.ds) AS user__ds__week
            , DATE_TRUNC('month', users_ds_source_src_10006.ds) AS user__ds__month
            , DATE_TRUNC('quarter', users_ds_source_src_10006.ds) AS user__ds__quarter
            , DATE_TRUNC('year', users_ds_source_src_10006.ds) AS user__ds__year
            , users_ds_source_src_10006.created_at AS user__created_at
            , DATE_TRUNC('week', users_ds_source_src_10006.created_at) AS user__created_at__week
            , DATE_TRUNC('month', users_ds_source_src_10006.created_at) AS user__created_at__month
            , DATE_TRUNC('quarter', users_ds_source_src_10006.created_at) AS user__created_at__quarter
            , DATE_TRUNC('year', users_ds_source_src_10006.created_at) AS user__created_at__year
            , users_ds_source_src_10006.ds_partitioned AS user__ds_partitioned
            , DATE_TRUNC('week', users_ds_source_src_10006.ds_partitioned) AS user__ds_partitioned__week
            , DATE_TRUNC('month', users_ds_source_src_10006.ds_partitioned) AS user__ds_partitioned__month
            , DATE_TRUNC('quarter', users_ds_source_src_10006.ds_partitioned) AS user__ds_partitioned__quarter
            , DATE_TRUNC('year', users_ds_source_src_10006.ds_partitioned) AS user__ds_partitioned__year
            , users_ds_source_src_10006.home_state AS user__home_state
            , users_ds_source_src_10006.user_id AS user
          FROM ***************************.dim_users users_ds_source_src_10006
        ) subq_3
      ) subq_4
      ON
        (
          subq_2.user = subq_4.user
        ) AND (
          subq_2.ds_partitioned = subq_4.ds_partitioned
        )
    ) subq_5
  ) subq_6
  GROUP BY
    subq_6.user__home_state
) subq_7
