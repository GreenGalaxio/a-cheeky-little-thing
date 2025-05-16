// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//donkeykong_fla.dkrevival_12

package donkeykong_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class dkrevival_12 extends MovieClip 
    {

        public var self:*;

        public function dkrevival_12()
        {
            addFrameScript(0, this.frame1, 149, this.frame150);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
        }

        internal function frame150():*
        {
            stop();
        }


    }
}//package donkeykong_fla

