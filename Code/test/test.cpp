#include "opencv2/core.hpp"
#include "gtest/gtest.h"

TEST(OpenCVTest, Given_When_Then)
{
    cv::Mat test_matrix{3, 4, CV_8UC1};
    SUCCEED();
}

int main(int argc, char** argv)
{
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}