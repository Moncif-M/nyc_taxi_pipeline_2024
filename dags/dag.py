import os
from datetime import datetime



from cosmos import DbtDag, ProjectConfig, ProfileConfig, ExecutionConfig, RenderConfig
from cosmos.profiles import SnowflakeUserPasswordProfileMapping


profile_config = ProfileConfig(
    profile_name="default",
    target_name="dev",
    profile_mapping=SnowflakeUserPasswordProfileMapping(
        conn_id="snowflake_adim", 
        profile_args={"database": "DB_TAXI", "schema": "TAXI"},
    )
)

dbt_snowflake_dag = DbtDag(
    project_config=ProjectConfig("/usr/local/airflow/dags/dbt",),
    operator_args={"install_deps": True},
    render_config=RenderConfig(
        should_detach_multiple_parents_tests=True,
    ),
    profile_config=profile_config,
    execution_config=ExecutionConfig(dbt_executable_path=f"{os.environ['AIRFLOW_HOME']}/dbt_venv/bin/dbt",),
    schedule="@daily",
    start_date=datetime(2025, 7, 25),
    catchup=False,
    dag_id="dbt_dag",
)