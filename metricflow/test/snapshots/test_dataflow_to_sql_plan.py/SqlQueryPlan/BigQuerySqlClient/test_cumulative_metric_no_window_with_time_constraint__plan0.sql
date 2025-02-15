-- Compute Metrics via Expressions
SELECT
  subq_5.txn_revenue AS revenue_all_time
  , subq_5.ds__month
FROM (
  -- Aggregate Measures
  SELECT
    SUM(subq_4.txn_revenue) AS txn_revenue
    , subq_4.ds__month
  FROM (
    -- Pass Only Elements:
    --   ['txn_revenue', 'ds__month']
    SELECT
      subq_2.txn_revenue
      , subq_2.ds__month
    FROM (
      -- Constrain Time Range to [2000-01-01T00:00:00, 2020-01-01T00:00:00]
      SELECT
        subq_1.txn_revenue
        , subq_1.ds
        , subq_1.ds__week
        , subq_1.ds__month
        , subq_1.ds__quarter
        , subq_1.ds__year
        , subq_1.metric_time
        , subq_1.metric_time__week
        , subq_1.metric_time__month
        , subq_1.metric_time__quarter
        , subq_1.metric_time__year
        , subq_1.user
      FROM (
        -- Metric Time Dimension 'ds'
        SELECT
          subq_0.txn_revenue
          , subq_0.ds
          , subq_0.ds__week
          , subq_0.ds__month
          , subq_0.ds__quarter
          , subq_0.ds__year
          , subq_0.ds AS metric_time
          , subq_0.ds__week AS metric_time__week
          , subq_0.ds__month AS metric_time__month
          , subq_0.ds__quarter AS metric_time__quarter
          , subq_0.ds__year AS metric_time__year
          , subq_0.user
        FROM (
          -- Read Elements From Data Source 'revenue'
          SELECT
            revenue_src_10005.revenue AS txn_revenue
            , revenue_src_10005.created_at AS ds
            , DATE_TRUNC(revenue_src_10005.created_at, isoweek) AS ds__week
            , DATE_TRUNC(revenue_src_10005.created_at, month) AS ds__month
            , DATE_TRUNC(revenue_src_10005.created_at, quarter) AS ds__quarter
            , DATE_TRUNC(revenue_src_10005.created_at, isoyear) AS ds__year
            , revenue_src_10005.user_id AS user
          FROM (
            -- User Defined SQL Query
            SELECT * FROM ***************************.fct_revenue
          ) revenue_src_10005
        ) subq_0
      ) subq_1
      WHERE (
        subq_1.metric_time >= CAST('2000-01-01' AS DATETIME)
      ) AND (
        subq_1.metric_time <= CAST('2020-01-01' AS DATETIME)
      )
    ) subq_2
  ) subq_4
  GROUP BY
    subq_4.ds__month
) subq_5
