import importlib.util
import pathlib
import unittest


ROOT = pathlib.Path(__file__).resolve().parents[2]
ADMIN_PATH = ROOT / "scripts" / "admin.py"

spec = importlib.util.spec_from_file_location("gt_admin", ADMIN_PATH)
admin = importlib.util.module_from_spec(spec)
assert spec and spec.loader
spec.loader.exec_module(admin)


class BotPreSimulationTests(unittest.TestCase):
    def test_individual_training_gain_decreases_with_age(self):
        young = admin.individual_training_gain(age=19, talent=8, fitness=92)
        older = admin.individual_training_gain(age=32, talent=8, fitness=92)
        self.assertGreater(young, older)

    def test_heavy_intensity_increases_age_projection(self):
        rng_l = admin._stable_rng("age-intensity")
        rng_h = admin._stable_rng("age-intensity")
        age_light = admin.derive_team_age_years(activity=85, rng=rng_l, intensity="light")
        age_heavy = admin.derive_team_age_years(activity=85, rng=rng_h, intensity="heavy")
        self.assertGreater(age_heavy, age_light)

    def test_old_teams_have_max_side_buildings(self):
        level, vip, sit, stand = admin.build_stadium_state(age_years=1.2, activity=65, league_tier=2)
        self.assertEqual(level, 20)
        self.assertLessEqual(vip, 2300)
        self.assertLessEqual(sit, 28500)
        self.assertLessEqual(stand, 48000)

    def test_standing_seats_are_always_capped(self):
        _, _, _, stand_t1 = admin.build_stadium_state(age_years=9.0, activity=100, league_tier=1)
        _, _, _, stand_t4 = admin.build_stadium_state(age_years=9.0, activity=100, league_tier=4)
        self.assertLessEqual(stand_t1, 60000)
        self.assertLessEqual(stand_t4, 30000)

    def test_training_curve_realistic_with_age(self):
        rng_a = admin._stable_rng("curve-a")
        rng_b = admin._stable_rng("curve-b")
        rng_c = admin._stable_rng("curve-c")

        young = admin.project_strength_from_training_curve(
            age=18,
            talent=8,
            training_center_level=20,
            activity=90,
            youth_focus=85,
            rng=rng_a,
        )
        prime = admin.project_strength_from_training_curve(
            age=24,
            talent=8,
            training_center_level=20,
            activity=90,
            youth_focus=85,
            rng=rng_b,
        )
        older = admin.project_strength_from_training_curve(
            age=33,
            talent=8,
            training_center_level=20,
            activity=90,
            youth_focus=85,
            rng=rng_c,
        )

        self.assertGreaterEqual(young, 48.0)
        self.assertGreater(prime, young)
        self.assertLess(older, prime)

    def test_heavy_intensity_raises_projection(self):
        rng_l = admin._stable_rng("strength-intensity")
        rng_h = admin._stable_rng("strength-intensity")
        light = admin.project_strength_from_training_curve(
            age=24,
            talent=8,
            training_center_level=18,
            activity=85,
            youth_focus=80,
            rng=rng_l,
            intensity="light",
        )
        heavy = admin.project_strength_from_training_curve(
            age=24,
            talent=8,
            training_center_level=18,
            activity=85,
            youth_focus=80,
            rng=rng_h,
            intensity="heavy",
        )
        self.assertGreaterEqual(heavy, light)

    def test_scouting_plus_training_projection_is_strong(self):
        rng = admin._stable_rng("scouting-training-camp")
        projected = admin.project_strength_from_training_curve(
            age=24,
            talent=9,
            training_center_level=20,
            activity=92,
            youth_focus=90,
            rng=rng,
            intensity="heavy",
        )
        self.assertGreaterEqual(projected, 85.0)

    def test_elite_projection_reaches_500_plus(self):
        rng = admin._stable_rng("elite-projection")
        projected = admin.project_strength_from_training_curve(
            age=24,
            talent=10,
            training_center_level=20,
            activity=95,
            youth_focus=92,
            rng=rng,
            intensity="heavy",
            elite_profile=True,
        )
        self.assertGreaterEqual(projected, 500.0)
        self.assertLessEqual(projected, 600.0)

    def test_elite_squad_has_9_or_10_talent_and_top_band(self):
        squad = admin._generate_squad(
            team_id="elite-top",
            team_name="Elite Top",
            age_years=4.0,
            activity=95,
            youth_focus=92,
            training_center_level=20,
            intensity="heavy",
        )
        self.assertEqual(len(squad), 18)
        self.assertTrue(all(p["talent"] in (9, 10) for p in squad))

        top11 = sorted((p["strength"] for p in squad), reverse=True)[:11]
        avg_top11 = sum(top11) / len(top11)
        self.assertGreaterEqual(avg_top11, 500.0)
        self.assertLessEqual(avg_top11, 600.0)

    def test_high_youth_focus_skews_younger_squad(self):
        young_avg = []
        old_avg = []

        for i in range(8):
            squad_young = admin._generate_squad(
                team_id=f"t-y-{i}",
                team_name="Youth FC",
                age_years=2.0,
                activity=90,
                youth_focus=90,
                training_center_level=20,
            )
            squad_old = admin._generate_squad(
                team_id=f"t-o-{i}",
                team_name="Veteran FC",
                age_years=2.0,
                activity=90,
                youth_focus=15,
                training_center_level=20,
            )
            young_avg.append(sum(p["age"] for p in squad_young) / len(squad_young))
            old_avg.append(sum(p["age"] for p in squad_old) / len(squad_old))

        self.assertLess(sum(young_avg) / len(young_avg), sum(old_avg) / len(old_avg))


if __name__ == "__main__":
    unittest.main()
