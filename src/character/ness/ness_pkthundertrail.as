// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ness_pkthundertrail

package 
{
    import flash.display.MovieClip;

    public dynamic class ness_pkthundertrail extends MovieClip 
    {

        public var attackBox:MovieClip;

        public function ness_pkthundertrail()
        {
            addFrameScript(18, this.frame19);
        }

        internal function frame19():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

