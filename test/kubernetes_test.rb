# frozen_string_literal: true
require "bundler/setup"
require "maxitest/autorun"
require 'kucodiff'

describe "Kubenretes roles" do
  it "does not have accidental diff between config files" do
    Kucodiff.diff(
      Dir["kubernetes/*.{yml,yaml}"].sort,
      ignore: /\.(args|limits|requests)\./,
      indent_pod: true,
      expected: {
        "kubernetes/migrate.yml-kubernetes/server.yml" => [
          "spec.template.metadata.labels.role",
          "spec.template.apiVersion",
          "spec.template.kind",
          "spec.template.metadata.annotations.samson/prerequisite",
          "spec.template.metadata.name",
          "spec.template.spec.restartPolicy"
        ]
      }
    ).must_equal({})
  end
end

# here
