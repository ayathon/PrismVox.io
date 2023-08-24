import React from "react";
import "@fontsource/playfair-display"; 
import { Link } from "react-router-dom";
import { Eclips1, Eclips2, Eclips3, Eclips4 } from "../assets";
<link href='https://fonts.googleapis.com/css?family=Playfair Display' rel='stylesheet'></link>

const Home = () => {
  return (
    <div className="flex flex-col justify-center items-center min-h-screen w-full lg:-mt-10">
      <h1 className="text-4xl text-center tracking-tight font-bold text-slate-200 max-w-7xl sm:text-5xl md:text-6xl lg:text-6xl">
        Now everyone  <br/><span className="italic " style={{ fontFamily:"Playfair Display",}}>including you</span> <br/> <span className="grad-text">can vote</span>
      </h1>
      <p className="text-center max-w-xl mt-4 font-medium text-slate-300">
        Create free, fair, transparent, and inclusive elections<br/> on the
        blockchain for your organization, school etc
      </p>

      <div></div>

      {/* CTA buttons */}
      <div className="flex flex-col sm:flex-row gap-4 mt-8 px-4 w-full justify-center">
        <Link
          to="/"
          className="inline-flex items-center justify-center w-full sm:w-fit  px-10 py-3 border border-transparent text-base font-[800] rounded-md text-black bg-[#FFAE6A] "
        >
          Vote Now
        </Link>
        
      </div>
      <div className="flex mt-14 mr-[-8%] justify-center items-center">
  <div className="relative">
    <div className="absolute w-[250px] h-[250px] rounded-full lg:mt-[-14%] lg:ml-[-14%] border-8 border-white overflow-hidden z-10">
      <img
        src={Eclips1}
        alt="Circle 1"
        className="w-full h-full object-cover"
      />
    </div>
    <div className="relative ml-36">
      <div className="w-48 h-48 z-10 rounded-full border-4 border-white overflow-hidden">
        <img
          src={Eclips2}
          alt="Circle 2"
          className="w-full h-full object-cover"
        />
      </div>
    </div>
  </div>
  <div className="hidden lg:flex">
    <div className="relative w-48 h-48 z-10 ml-[-14%] rounded-full border-2 border-white overflow-hidden">
      <img
        src={Eclips3}
        alt="Circle 3"
        className="w-full h-full object-cover"
      />
    </div>
    <div className="relative mt-[-24%] ml-[-14%] h-[300px] overflow-hidden">
      <img
        src={Eclips4}
        alt="Circle 4"
        className="w-full h-full object-cover"
      />
    </div>
  </div>
</div>


    </div>
  );
};

export default Home;
